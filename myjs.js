function doLike(pid, uid) {
    console.log("Liking post:", pid, "by user:", uid);

    const d = {
        uid: uid,
        pid: pid,
        operation: 'like'
    };

    $.ajax({
        url: "LikeServlet",
        data: d,
        type: "POST",
        success: function (data, textStatus, jqXHR) {
            console.log("Server Response:", data);
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.error("AJAX error:", textStatus, errorThrown);
        }
    });
}
