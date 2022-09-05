// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "./controllers/hello_controller.js"
import "@rails/actiontext"
import "trix"

document.querySelectorAll(".subcomment-form-display").forEach((el) => {
  el.addEventListener('click', (ev) => {
    ev.preventDefault();
    el.nextElementSibling.style = 'display: block;';
  });
});