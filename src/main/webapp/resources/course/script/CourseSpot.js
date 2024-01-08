export class CourseSpot {
	constructor(tourcode, title, contenttype, image, mapx, mapy){
		this.tourcode = tourcode;
		this.title = title;
		this.contenttype = contenttype;
		this.image = image;
		this.mapx = mapx;
		this.mapy = mapy;
	}
	
	getTourcode(){
		return this.tourcode;
	}
	
	getTitle(){
		return this.title;
	}
	
	getContenttype(){
		return this.contenttype;
	}
	
	getImage(){
		return this.image;
	}
	
	getMapx(){
		return this.mapx;
	}
	
	getMapy(){
		return this.mapy;
	}
}