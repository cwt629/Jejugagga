<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="root" value="<%=request.getContextPath()%>"/>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <link
            href="https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Jua&family=Lobster&family=Nanum+Pen+Script&family=Permanent+Marker&family=Single+Day&display=swap"
            rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/res/startpage/new.css">
    <link rel="stylesheet" href="/res/startpage/new2.css">
    <link rel="stylesheet" href="/res/startpage/loading2.css">
    <link rel="stylesheet" href="/res/startpage/loading.css">
    <link rel="icon" type="image/svg+xml" href="favicon.svg"/>

    <style>
        body,
        html {
            padding: 0;
        }

        .fade-out {
            transition: opacity 0.6s ease-in-out;
            opacity: 1;
        }

        .hidden {
            opacity: 0;
        }

        .blue {
            opacity: 0;
        }

        .neon-on {
            opacity: 1;
            transition: opacity 2s ease;
            /* 부드러운 전환 효과를 위해 */
        }

        .box {
            top: 600px;
            left: 570px;
        }

        .blue {
            top: 200px;
        }
    </style>
    <script>
        window.onload = function () {
            setTimeout(function () {
                var elements = document.querySelectorAll('.fade-out');
                elements.forEach(function (element) {
                    element.classList.add('hidden');
                });
            }, 8000);

            // 10초 후에 네온 사인을 활성화하는 로직 추가
            setTimeout(function () {
                var neonSign = document.querySelector('.blue');
                if (neonSign) {
                    neonSign.classList.add('neon-on');
                } else {
                    console.error("Neon sign element not found");
                }
            }, 9500);
        }
    </script>
</head>

<body>
<div class='siteWrap'>
    <div class="loading-container fade-out">
        <div class="loading"></div>
        <div id="loading-text">loading</div>
    </div>
    <div class="box fade-out">
        <div class="loader4"></div>
    </div>
    <div class='textMask'>
        <svg id="svg" class='textMask__svg'>
            <defs>
                <mask class='textMask__mask' id='mask' x='0' y='0' width='100%' height='100%'>
                    <rect class='textMask__alpha' id="alpha" x="0" y="0" width="100%" height="100%"/>
                    <text class='textMask__title will-animate' id="title" x="50%" y="50%" dy=".3em" text-anchor="middle"
                          style="opacity: 0.6;">GET START
                    </text>
                </mask>
            </defs>
            <rect class='textMask__base' id="base" x="0" y="0" width="100%" height="100%"/>
        </svg>
    </div>
    <h1 id='siteTitle' class='siteTitle will-animate' style="opacity: 0.8;">제주가까</h1>
    <!-- <button id='replay'>
        Replay</button> -->
    <div id="background" class='bgImage'
         style='background-image:url(https://c1.staticflickr.com/9/8682/15309989834_cb5df23871_h.jpg);'></div>

    <!--네온 사인 전광판-->
    <main class="blue" ng-app="app" ng-controller="neon">
        <div class="wrapper">
            <a href="${root}/main" style="cursor: pointer; text-decoration: none;">
                <h1 class="font1">
                    <span ng-bind="user.name()"></span>
                    <h2 class="font2"> made by @Bitcamp</h2>
                </h1>
            </a>
        </div>
    </main>

</div>

</body>

<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<script src="https://use.typekit.net/osv0ujj.js"></script>
<script>try {
    Typekit.load({async: true});
} catch (e) {
}</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.6.1/gsap.min.js"></script>
<script src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/16327/SplitText.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.8.2/angular.min.js"></script>
<script src="/res/startpage/startjs.js"></script>
<script src="/res/startpage/startjs2.js"></script>
</html>
