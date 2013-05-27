$(function() {
 $("#draggable").draggable({
      appendTo: "body",
      helper: "clone"
 });

    
 // This will display the droppable (jquery-ui)    
  // Create the user priorities list
  var numbers = [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18 ];
  
 
  for ( var i=0; i<18; i++ ) {
    $('<th>' + numbers[i] + '</th>').data( 'number', numbers[i] ).attr( 'id', 'pri'+numbers[i] ).appendTo( '#pri' ).droppable( {
      containment: '#content',
      stack: '#pri ul',
      accept: ":not(.ui-sortable-helper)",
      activeClass: "ui-state-default",
      hoverClass: "ui-state-hover"
    } );
  }
 

})

 $(document).ready(function() {
    $( "#draggable li" ).draggable({appendTo: "body", helper: "clone"});

    $( "#pri th" ).droppable({
      activeClass: "ui-state-default",
      hoverClass: "ui-state-hover",
      accept: ":not(.ui-sortable-helper)",
      drop: function( event, ui ) {
      	 $(this).find(".placeholder").remove();  
      	 $("<li></li>").append(ui.draggable.contents().clone(true)).addClass( "showSurvey"). appendTo(this);
      	 value_to_submit= $(ui.draggable.find("input[type=hidden]"));
      	 var category = value_to_submit.context.childNodes[1].attributes.data.value;
      	 var id = gon.your_object.id
      	 var priority = "cat" + this.id.charAt(3)+this.id.charAt(4)
         var valuesToSubmit = null;
         valuesToSubmit = { userpri: priority, categoryValue: category, uid: id};
      	 $.ajax({
        type: "PUT",
        url: "updateProfile",
        data: valuesToSubmit,
        dataType: "JSON" 
        }).success(function(data){
          // disaply new charge in the table 
          $('body').append(data);

          // clear the form
          //$("input#task_name").val('');

          //focus on the input again
          //$("input#task_name").focus();
    });
        return false; // prevents normal behaviour
      }
    })

 
}); 

$(function() { $( "#login" ).click(function( event ) {event.preventDefault();});}); 
$(function() { $( "#surveysubmit" ).click(function( event ) {event.preventDefault();});}); 
 
 
 
       