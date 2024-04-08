var textArea = document.getElementById("msg");

function deleteChat(id)
{
    var text = "Press a button!\nEither OK or Cancel.";
    if (confirm(text) == true) {
        $.ajax({
            url: "AjaxDelete.jsp",
            type: "POST",
            data: {cid: id},
            success: function(result) {

            }
        });
    } else {
        text = "You canceled!";
    }
}
function sendChat() {
    var msg = textArea.value;


    $.ajax({
        url: "AjaxChat.jsp",
        type: "POST",
        data: {chat: msg},
        success: function(result) {
            textArea.value = "";
            $('#conversation').animate({scrollTop: $('#conversation')[0].scrollHeight});
            reloadSection();
        }
    });





}

reloadSection();

$(document).ready(function() {
    setInterval(function() {
        reloadSection();
    }, 5000);
});

function reloadSection() {
    $("#conversation").load('Load.jsp');
    $('#conversation').animate({scrollTop: $('#conversation')[0].scrollHeight});
}



























   