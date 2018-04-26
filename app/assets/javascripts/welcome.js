$(document).ready(function() {

  slideshow();
})

let slideIndex = 0;

const slideshow = () => {

    let i;
    let x = document.getElementsByClassName("welcomeImages");
    for (i = 0; i < x.length; i++) {
      x[i].style.display = "none";
    }

    slideIndex++;
    if (slideIndex > x.length) {slideIndex = 1}
    x[slideIndex-1].style.display = "block";
    setTimeout(slideshow, 3500); // Change image every 2 seconds
}
