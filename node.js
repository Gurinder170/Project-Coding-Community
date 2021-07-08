$(document).ready(function () {
    $('.collapsible').collapsible();
});

$(document).ready(function () {
    $('.multi_select').selectpicker();
})

document.addEventListener('DOMContentLoaded', function () {
    var elems = document.querySelectorAll('.collapsible');
    var instances = M.Collapsible.init(elems, options);
});


