function doLike(pid, uid) {
    console.log(pid + "," + uid);

    var d = {
        pid: pid,
        uid: uid,
        operation: "like"
    };

    console.log(pid, uid, d);

    $.ajax({
        url: "LikesServlet",
        data: d,
        success: function (data, textStatus, jqXHR) {
            console.log(data);
            if (data.trim() == "true") {

                var c = $(".like-counter").html();
                c++;
                $(".like-counter").html(c);
                
            }
            
               
            
               Swal.fire({
                    position: 'top-end',
                    icon: 'success',
                    title: 'Thank you for your like',
                    showConfirmButton: false,
                    timer: 1500
                });
                
               
            
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log(data);
        }
    });

}
