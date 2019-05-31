$(document).ready(function(){
    /* attach a submit handler to the form */
    $("#contactForm").submit(function(event) {
        /* stop form from submitting normally */
        event.preventDefault(); 
        
        /* Send the data using post and put the results in a div */
        $.post("php/contacts.html", $("#contactForm").serialize(),function(result){
            $('#contactResult').html(result);
        });
    }); 
});
    