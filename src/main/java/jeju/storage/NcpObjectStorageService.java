package jeju.storage;

import java.io.InputStream;
import java.util.UUID;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.client.builder.AwsClientBuilder;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;

@Service
public class NcpObjectStorageService implements ObjectStorageService {
	
	AmazonS3 s3;
	
	public NcpObjectStorageService(NaverConfig naverConfig) {
		System.out.println("NcpObjectStorageService 생성 완료");
		s3 = AmazonS3ClientBuilder.standard()
				.withEndpointConfiguration(new AwsClientBuilder.EndpointConfiguration(
						naverConfig.getEndPoint(), naverConfig.getRegionName()))
				.withCredentials(new AWSStaticCredentialsProvider(new BasicAWSCredentials(
						naverConfig.getAccessKey(), naverConfig.getSecretKey())))
				.build();
	}

	@Override
	public String uploadFile(String bucketName, String directoryPath, MultipartFile file) {
		System.out.println("uploadFile="+file.getOriginalFilename());

		if (file.isEmpty()) {
			return null;
		}

		try (InputStream fileIn = file.getInputStream()) {
			String filename = UUID.randomUUID().toString();

			ObjectMetadata objectMetadata = new ObjectMetadata();
			objectMetadata.setContentType(file.getContentType());

			PutObjectRequest objectRequest = new PutObjectRequest(
					bucketName,
					directoryPath +"/"+ filename,
					fileIn,
					objectMetadata).withCannedAcl(CannedAccessControlList.PublicRead);

			s3.putObject(objectRequest);
			
			//return s3.getUrl(bucketName, directoryPath + filename).toString();
			return filename;

		} catch (Exception e) {
			throw new RuntimeException("파일 업로드 오류", e);
		}
	}

	@Override
	public void deleteFile(String bucketName, String directoryPath, String fileName) {
		// TODO Auto-generated method stub
		String path=directoryPath+"/"+fileName;
		System.out.println("path="+path);
		//해당 버킷에 파일이 존재하면 true 반환 
		boolean isfind=s3.doesObjectExist(bucketName, path);
		System.out.println("isfind="+isfind);
		//존재할경우 삭제
		if(isfind) {
			s3.deleteObject(bucketName, path);
			System.out.println(path+":삭제완료!");
		}				
	}

	// 파일을 네이버 클라우드 스토리지에 업로드하고 파일명을 반환하는 메서드
	public String reviewUploadFile(String bucketName, String bucketFolder, MultipartFile file) {
		if (file.isEmpty()) {
			return null;
		}

		try (InputStream fileIn = file.getInputStream()) {
			String filename = UUID.randomUUID().toString();
			String fullFilePath = bucketFolder + "/" + filename; // 폴더와 파일명을 조합한 전체 경로

			ObjectMetadata objectMetadata = new ObjectMetadata();
			objectMetadata.setContentType(file.getContentType());

			PutObjectRequest objectRequest = new PutObjectRequest(
					bucketName,
					fullFilePath,
					fileIn,
					objectMetadata).withCannedAcl(CannedAccessControlList.PublicRead);

			// 실제 파일 업로드
			s3.putObject(objectRequest);

			// 업로드된 파일의 URL을 반환합니다.
			String fileUrl = s3.getUrl(bucketName, fullFilePath).toString();
			return fileUrl;

		} catch (Exception e) {
			throw new RuntimeException("파일 업로드 오류", e);
		}
	}
}

