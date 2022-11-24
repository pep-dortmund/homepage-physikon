const carouselElement = document.querySelector('#katalog-carousel');
const numSlides = carouselElement.querySelectorAll('.carousel-item').length;

function getCarouselIndex(id) {
  console.log(id);
  return Array.from(carouselElement.querySelectorAll('.carousel-item').values()).findIndex((element) => element.id == id);
}

if (carouselElement) {
  const carousel = new bootstrap.Carousel(carouselElement);

  if (document.location.hash == "") {
    carousel.to(Math.floor(Math.random() * numSlides));
  } else {
    carousel.to(getCarouselIndex(document.location.hash.substring(1)));
  }
}

