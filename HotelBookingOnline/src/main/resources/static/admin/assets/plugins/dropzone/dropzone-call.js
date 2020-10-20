 Dropzone.autoDiscover = false;

   $(document).ready(function () {
        $("#dZUpload").dropzone({
            maxFiles: 2000,
            url: "uploadImage",
            success: function (file, response) {
                console.log(response);
            }
        });
   })