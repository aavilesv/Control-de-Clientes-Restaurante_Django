var cedula = document.getElementById('cedula');
function validarCedula(cedula) {
    if (typeof(cedula) == 'string' && cedula.length == 10 && /^\d+$/.test(cedula)) {
        var digitos = cedula.split('').map(Number);
        var codigo_provincia = digitos[0] * 10 + digitos[1];

        //if (codigo_provincia >= 1 && (codigo_provincia <= 24 || codigo_provincia == 30) && digitos[2] < 6) {

        if (codigo_provincia >= 1 && (codigo_provincia <= 24 || codigo_provincia == 30)) {
            var digito_verificador = digitos.pop();

            var digito_calculado = digitos.reduce(
                    function (valorPrevio, valorActual, indice) {
                        return valorPrevio - (valorActual * (2 - indice % 2)) % 9 - (valorActual == 9) * 9;
                    }, 1000) % 10;
            return digito_calculado === digito_verificador;
        }
    }
    return false;
}

function soloValidacion(e) {
    key = e.keyCode || e.which;
    teclado = String.fromCharCode(key);
    letras = "abcdefghijklmnñopqrstuwxyzABCDEFGHIJKLVvMNÑOPQRSTUWXYZ123456789";
    teclado_especial = false;
    if (letras.indexOf(teclado) == -1 && !teclado_especial) {
        return false;
    }
}

var web = document.getElementById('web');
function validarWeb(web) {
    expr = /^www.\w+.\w+$/gi;
    if (!expr.test(web)) {
        $("#web").val("");
        swal("La dirección web !! " + web + " !! es incorrecta.");
    }
}

function soloNumeros(e) {
    var key = window.Event ? e.which : e.keyCode
    return (key >= 48 && key <= 57)
}

function soloNumeros1(e) {
    key = e.keyCode || e.which;
    teclado = String.fromCharCode(key);
    letras = "1234567890.";
    teclado_especial = false;
    if (letras.indexOf(teclado) == -1 && !teclado_especial) {
        return false;
    }
}

function sololetras(e) {
    key = e.keyCode || e.which;
    teclado = String.fromCharCode(key);
    letras = "abcdefghijklmnopqrstuwxyzABCDEFGHIJKLMNÑOvPQRSTUWXYZñvV ";
    teclado_especial = false;
    if (letras.indexOf(teclado) == -1 && !teclado_especial) {
        return false;
    }
}

function soloNumerosT(e) {

    var num_sf = document.getElementById('tel').value;
    var num_cf = '';
    num_cf = num_sf.substring(0, 3) + "-";
    num_cf += num_sf.substring(3, 6) + "-";
    num_cf += num_sf.substring(6, 9);
    document.getElementById('format').value = num_cf;

    var key = window.Event ? e.which : e.keyCode
    var c
    c += 1;
    if (c == 3)
        key = key + "-";
    return (key >= 48 && key <= 57)
}

function isValidDate(day, month, year) {
    var dteDate;
    month = month - 1;
    dteDate = new Date(year, month, day);
    return ((day == dteDate.getDate()) && (month == dteDate.getMonth()) && (year == dteDate.getFullYear()));
}

function validate_fecha(fecha) {
    var patron = new RegExp("^(19|20)+([0-9]{2})([-])([0-9]{1,2})([-])([0-9]{1,2})$");
    if (fecha.search(patron) == 0) {
        var values = fecha.split("-");
        if (isValidDate(values[2], values[1], values[0])) {
            return true;
        }
    }
    return false;
}

function calcularEdad() {
    var fecha = document.getElementById("user_date").value;
    if (validate_fecha(fecha) == true) {
        // Si la fecha es correcta, calculamos la edad
        var values = fecha.split("-");
        var dia = values[2];
        var mes = values[1];
        var ano = values[0];

        // cogemos los valores actuales
        var fecha_hoy = new Date();
        var ahora_ano = fecha_hoy.getYear();
        var ahora_mes = fecha_hoy.getMonth() + 1;
        var ahora_dia = fecha_hoy.getDate();

        // realizamos el calculo
        var edad = (ahora_ano + 1900) - ano;
        if (ahora_mes < mes) {
            edad--;
        }
        if ((mes == ahora_mes) && (ahora_dia < dia)) {
            edad--;
        }
        if (edad > 1900) {
            edad -= 1900;
        }

        // calculamos los meses
        var meses = 0;
        if (ahora_mes > mes)
            meses = ahora_mes - mes;
        if (ahora_mes < mes)
            meses = 12 - (mes - ahora_mes);
        if (ahora_mes == mes && dia > ahora_dia)
            meses = 11;

        // calculamos los dias
        var dias = 0;
        if (ahora_dia > dia)
            dias = ahora_dia - dia;
        if (ahora_dia < dia) {
            ultimoDiaMes = new Date(ahora_ano, ahora_mes, 0);
            dias = ultimoDiaMes.getDate() - (dia - ahora_dia);
        }


        document.getElementById("pac_Edad").value = edad;
        document.getElementById("pac_Edad1").value = edad;
    } else {
        document.getElementById("pac_Edad").value = "No Selecciono Fecha";
        document.getElementById("pac_Edad1").value = "No Selecciono Fecha";
    }
}

function calcularFechaActual() {
    var fecha = document.getElementById("PAC_FECHA").value;
    document.getElementById("PAC_FECHA1").value = fecha;

}

var email = document.getElementById('email');
function validarEmail(email) {
    expr = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    if (!expr.test(email)) {
        $("#id_email").val("");

        swal("La dirección de correo  " + email + " es incorrecta.");
    } else {
        alertify.success('Email Valido');
    }
}

var number = document.getElementById('ruc');
function validarRuc(number) {
    var dto = number.length;
    var valor;
    var acu = 0;
    if (number == "") {
        $("#id_ruc").val("");
        swal('No has ingresado ningún dato, porfavor ingresar los datos correspondientes.');
    } else {
        for (var i = 0; i < dto; i++) {
            valor = number.substring(i, i + 1);
            if (valor == 0 || valor == 1 || valor == 2 || valor == 3 || valor == 4 || valor == 5 || valor == 6 || valor == 7 || valor == 8 || valor == 9) {
                acu = acu + 1;
            }
        }
        if (acu == dto) {
            while (number.substring(10, 13) != 001) {
                $("#id_ruc").val("");
                swal('Los tres últimos dígitos no tienen el código del RUC 001.');
                return;
            }
            while (number.substring(0, 2) > 24) {
                $("#id_ruc").val("");
                swal('Los dos primeros dígitos no pueden ser mayores a 24.');
                return;
            }
            var porcion1 = number.substring(2, 3);
        }
    }
}

function verificarCedula(cedula) {
    if (typeof(cedula) == 'string' && cedula.length == 10 && /^\d+$/.test(cedula)) {
        var digitos = cedula.split('').map(Number);
        var codigo_provincia = digitos[0] * 10 + digitos[1];

        if (codigo_provincia >= 1 && (codigo_provincia <= 24 || codigo_provincia == 30) && digitos[2] < 6) {

            if (codigo_provincia >= 1 && (codigo_provincia <= 24 || codigo_provincia == 30)) {
                var digito_verificador = digitos.pop();

                var digito_calculado = digitos.reduce(
                        function (valorPrevio, valorActual, indice) {
                            return valorPrevio - (valorActual * (2 - indice % 2)) % 9 - (valorActual == 9) * 9;
                        }, 1000) % 10;
                return digito_calculado === digito_verificador;
            }
        }
        return false;
    }
}