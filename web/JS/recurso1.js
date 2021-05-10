$(document).ready(function() {

            OpenPay.setId('mikalxsdbk0bkgcfuamb');
            OpenPay.setApiKey('pk_4a6ca2abeaad4158b309a42beb63cdf5');
            OpenPay.setSandboxMode(true);
            //Se genera el id de dispositivo
            var deviceSessionId = OpenPay.deviceData.setup("processCard", "deviceIdHiddenFieldName");
            
            var sucess_callbak = function(response) {
              alert('Operación exitosa');
              parent.location.href="Controlador?accion=GenerarCompra";
              var token_id = response.data.id;
              $('#token_id').val(token_id);
              $('#processCard').submit();
            };

            var error_callbak = function(response) {
                var desc = response.data.description != undefined ? response.data.description : response.message;
                alert("ERROR [" + response.status + "] " + desc);
                $("#makeRequestCard").prop("disabled", false);
            };
            
            $('#makeRequestCard').on('click', function(event) {
                event.preventDefault();
                $("#makeRequestCard").prop( "disabled", true);
                OpenPay.token.extractFormAndCreate('processCard', sucess_callbak, error_callbak);                
            });


        });