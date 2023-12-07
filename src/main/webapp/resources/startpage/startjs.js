var Intro = function() {

    var
        textMaskAlpha,
        textMaskTitle,
        background,
        body,
        tl,
        svg,
        title,
        replay;

    var _init = function() {
        svg           = document.getElementById('svg');
        textMaskAlpha = document.getElementById('alpha');
        textMaskTitle = document.getElementById('title');
        background    = document.getElementById('background');
        body          = document.getElementsByTagName('body')[0];
        tl            = gsap.timeline({delay:1}); // TimelineLite 대신 gsap.timeline을 사용
        title         = document.getElementById('siteTitle');
        replay        = document.getElementById('replay');

        _setVisible();
        _animateHero();
    }

    var _setVisible = function() {
        gsap.set(".will-animate", {visibility: 'visible'}); // TweenLite.set 대신 gsap.set을 사용
    }

    var _animateHero = function() {
        tl
            .to(svg, 1.6, { opacity: 0, scale: 1.5, transformOrigin: '50% 50%', ease: "power1.out"}) // Power1.easeOut 대신 "power1.out" 사용
            .from(title, 2.6, { scale: 0.5, opacity: 0, transformOrigin: '50% 50%', ease: "back.out"}, 0); // Back.easeOut 대신 "back.out" 사용
    }

    var _play = function() {
        tl.restart({delay:0.3});
    }

    return {
        init: _init
    }
}();

Intro.init();
