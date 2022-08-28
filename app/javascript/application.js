// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"  
import "./controllers"  
import * as bootstrap from "bootstrap"  
window.bootstrap = bootstrap




$(document).ready(function(){
  $(".clickable-link").on('click', function(e){
    url = $(this).attr('data-link-path');
    window.location = url;
  });
});