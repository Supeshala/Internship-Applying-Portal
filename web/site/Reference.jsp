<%-- 
    Document   : Reference
    Created on : Nov 24, 2017, 11:17:21 AM
    Author     : tt2017071
--%>
<style type="text/css">
    #progressBox{
        width: 500px;
        height: auto;
    }
    #fileName{
        width: 304px;
    }
/*    #upFile{
        position: relative;
        overflow: hidden;
        margin: 10px;
    }*/
/*    .upload{
        opacity: 0;
        cursor: pointer;
        top: 0;
        right: 0;
        margin: 0;
        padding: 0;
        position: absolute;
    }*/
    .myimgs{
        margin-left: 10px;
        margin-top: 10px;
        cursor: pointer;
    }

</style>

<script type="text/javascript">

    
    function getFileName() {
        
//$(document).ready(function() {
//    var val = $('input[type=file]').val().toLowerCase();
//       var regex = new RegExp("(.*?)\.(pdf| docx| doc)$");
//        if(!(regex.test(val))) {
//            $('.uploadExtensionError').show();
//            event.preventDefault();
//        }
//});
        alert("okkkkkkkkkk");
        var filename = document.getElementById("selectFile").value;
        var f = filename.split("\\");
        alert("okkkkkkkkkk1111111111");
        document.getElementById("fileName").value = f[f.length - 1];
        alert("okkkkkkkkkk22222222221");
        var a = document.getElementById("selectFile").files;

        for (var i = 0; i < a.length; i++) {
            alert(a[i].name + " , " + ((a[i].size / 1024) / 1024) / 1024);
            alert("okkkkkkkkkk4444444444444444444444444");
        }

    }

    function readURL(input) {
        

        getFileName();

        var c = 0;

        for (var i = 0; i < input.files.length; i++) {

            if (input.files[i] !== null) {

                var reader = new FileReader();
                reader.onload = function (e) {

                    var elem = document.createElement("img");
                    elem.setAttribute("id", c);
                    elem.setAttribute("class", "myimgs");
                    elem.setAttribute("src", e.target.result);
                    elem.setAttribute("height", "100");
                    elem.setAttribute("width", "100");
                    elem.setAttribute("onclick", 'deleteimage(' + c + ')');

                    document.getElementById("drop-zone").appendChild(elem);

                    c++;
                }
                reader.readAsDataURL(input.files[i]);

            }
        }

    }

    function deleteimage(x) {

        $("#" + x).remove();

    }


</script>

<div id="reference">   
    <div class="panel panel-default">
        <div class="panel-body">


            <!--<div class="col-lg-6"> -->         


            <div class="panel panel-default">
                <div class="panel-heading"><strong>Upload Files</strong> <small>Cover Letter , Resume , Police report</small></div>
                <div class="panel-body">

                    <!-- Standar Form -->
                    <h4>Select files from your computer</h4>
                    <form enctype="multipart/form-data" method="post" id="uploadForm" action="uploadfils">
                        <input disabled="disabled" id="fileName" placeholder="Choose File"/>
                        

                        <div id="upFile" class="btn btn-primary">
                            <span>Select</span>
                            <input onchange="readURL(this)" class="upload" type="file" name="myfile" id="selectFile" data-type="image" />
                        </div><!--
                   -->
                   <div class="uploadExtensionError" style="display: none"> Only PDF allowed! </div>
                    <!-- Drop Zone -->
                    <h4>Or drag and drop files below</h4>
                    <div class="upload-drop-zone" id="drop-zone">

                    </div>

                    <!-- Progress Bar -->
                    <ul class="list-inline pull-right">
                        <li><button type="button" class="btn btn-default prev-step">Previous</button></li>
                        <li><button type="submit" class="btn btn-primary" name="profileUpdate" value="save">Save and continue</button></li>
                    </ul>
 </form>
                    <!-- Upload Finished -->

                </div>
            </div>
            <!-- /container -->








        </div>
    </div>     


</div>