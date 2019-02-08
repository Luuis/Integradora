$(window).on('load', function() {
    if($('.validate').length > 0) {
        $('.validate').parsley().on('form:error', function (fi) {
            for (var idx in fi.fields) {
                if(fi.fields[idx].getErrorsMessages()[0]) {
                    alertify.error(fi.fields[idx].getErrorsMessages()[0]);
                }
            }
        });
    }
    
    if($('.people').length > 0) {
        var typingTimer;
        var $input = $('#busquedaTermino');
        var $tipo = $('#busquedaTipo');
        var $remit = $('#busquedaRemitente');

        $input.on('keyup', function () {
          clearTimeout(typingTimer);
          typingTimer = setTimeout(doneTyping, 500);
        });

        $input.on('keydown', function () {
          clearTimeout(typingTimer);
        });

        function doneTyping() {
        $.ajax({
            url: 'ServletContactos',
            type: 'GET',
            dataType: 'json',
            data: {tipo: $tipo.val(), remitente: $remit.val(), busqueda: $input.val()},
            success: function(data) {
                var c = "";
                console.log(data.contactos.length);
                if(data.contactos.length > 0) {
                    Object.keys(data.contactos).forEach(function(key) {
                        c += '<div class="contact"><a href="mensajes.jsp?c=' +
                          data.contactos[key].id + '">';
                        if (data.contactos[key].leido) {
                            c+= data.contactos[key].nombre;
                        } else {
                            c+= '<strong>' + data.contactos[key].nombre + '</strong>';
                        }
                        c += '</a></div>';
                    });
                } else {
                    c += '<div class="contact"><em>Sin contactos</em></div>';
                }
                $("#contacts").html(c);
            },
            error: function() {
                console.log('fail');
                console.log(typeof data);
            }
        });
     }
     
        doneTyping();
    }
    $("#conversation").scrollTop($("#conversation")[0].scrollHeight);
});

$('input[name=tipo]').on('change', function() {
    $('.registro').slideUp();
    $('.registro fieldset').prop("disabled", true);
    $('#reg-' + $(this).data("num")).slideDown();
    $('#reg-' + $(this).data("num") + " fieldset").prop("disabled", false);
});