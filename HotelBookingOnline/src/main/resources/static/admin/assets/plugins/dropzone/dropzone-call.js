 Dropzone.autoDiscover = false;

   $(document).ready(function () {
        $("#dZUpload").dropzone({
            maxFiles: 2000,
            url: "uploadUserImage",
            success: function (file, response) {
                console.log(response);
            }
        });
   })