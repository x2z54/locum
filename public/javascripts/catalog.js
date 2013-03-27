$(function(){ 
  $('.goto-brand').click(function(){    
    window.location = $(this).closest('.category-wrapper').find('.brand-select option:selected').data('link');
  });
});