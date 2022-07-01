const beep = () => {
    const audio = new Audio();
    audio.src = './assets/bip.mp3';
    audio.play();
}

$(function() {
    window.addEventListener('message', function(event) {
        var data = event.data;
        if (data.action == 'showui') {
            $('.bip').css('display', 'block')
            
        
        } else {
            $('.bip').css('display', 'none')
        }

        if (data.action == 'showui2') {
            $('.bip').css('display', 'block')
            $("#heh").html(data.rue);
            $("#vehicule").html(data.vehicule);
            $("#info").html(data.info);
            beep();
            setTimeout(() => {
                $('.bip').css('display', 'none')
          
            }, data.timer);
        }

        if (data.action == 'showui4') {
            $('.container1').css('display', 'block')

        }
        

    });

    $(".button").click(function() {
        info = $(".input").val();
        rue = $(".iput").val();
        veh = $(".veh").val();
        $.post('https://bip_pompier/button', JSON.stringify({ehehe, test, veh}));
        $('.container1').css('display', 'none')
        reset();
    })

    $("#close").click(function() {
        $('.container1').css('display', 'none')
        $.post('https://bip_pompier/close');
    })

})


function reset() {
    $(".input").val("");
    $(".iput").val("");
    $(".veh").val("");
}