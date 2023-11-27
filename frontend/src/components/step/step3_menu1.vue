<template>
  <section class="wrapper">
    <div class="container">
      <div class="owl-carousel owl-theme">
        <div class="item" v-for="item in carouselItems" :key="item.id">
          <div class="heading">
            <h5>{{ item.heading }}</h5>
            <h3>{{ item.subHeading }}</h3>
          </div>
          <p v-for="paragraph in item.paragraphs" :key="paragraph.id">{{ paragraph.text }}</p>
        </div>
      </div>
    </div>
  </section>
</template>

<script>
import 'owl.carousel/dist/assets/owl.carousel.css';
import 'owl.carousel';
import $ from 'jquery';

export default {
  data() {
    return {
      carouselItems: [
        {
          id: 1,
          heading: 'THE CITY VIEW1',
          subHeading: 'A charming view of the city',
          paragraphs: [
            { id: 1, text: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.' },
            { id: 2, text: 'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.' }
          ]
        },
        {
          id: 2,
          heading: 'THE CITY VIEW2',
          subHeading: 'A charming view of the city',
          paragraphs: [
            { id: 1, text: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.' },
            { id: 2, text: 'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.' }
          ]
        },        {
          id: 3,
          heading: 'THE CITY VIEW3',
          subHeading: 'A charming view of the city',
          paragraphs: [
            { id: 1, text: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.' },
            { id: 2, text: 'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.' }
          ]
        },        
        // Add more items as needed
      ],
    };
  },
  mounted() {
    // Initialize Owl Carousel
    $('.owl-carousel').owlCarousel({
      loop: true,
      margin: 10,
      nav: true,
      dots: false,
      navText: ["<i class='far fa-long-arrow-alt-left'></i>", "<i class='far fa-long-arrow-alt-right'></i>"],
      responsive: {
        0: { items: 1 },
        768: { items: 1 },
        1000: { items: 1 },
      },
    });
  },
};
</script>

<style scoped>
/* Add your component-specific styles here */
</style>



