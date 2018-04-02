<%-- 
    Document   : personal_details
    Created on : Nov 24, 2017, 11:16:48 AM
    Author     : tt2017071
--%>

   <legend>Personal Details</legend>

                                <form method="POST" action="PDetails" enctype="multipart/form-data">
                                    <div class="form-horizontal">

                                        <div class="form-group">
                                            <label class="col-md-4 control-label" for="intial_name">Surname with initials</label>  
                                            <div class="col-md-4">
                                                <input id="intial_name" name="intial_name" type="text" placeholder="" class="form-control input-md" required="">
                                                <span class="help-block">Eg : E . I Senanayake</span>  
                                            </div>

                                        </div>

                                        <!-- Text input-->
                                        <div class="form-group">
                                            <label class="col-md-4 control-label" for="fname">Full Name</label>  
                                            <div class="col-md-6">
                                                <input id="fname" name="fname" type="text" placeholder="" class="form-control input-md" required autocomplete="off">

                                            </div>
                                        </div>

                                        <!-- Multiple Radios -->
                                        <div class="form-group">
                                            <label class="col-md-4 control-label" for="gender">Gender</label>
                                            <div class="col-md-4">
                                                <div class="radio">
                                                    <label for="gender-0">
                                                        <input type="radio" name="gender" id="gender-0" value="male" checked="checked">
                                                        Male
                                                    </label>
                                                </div>
                                                <div class="radio">
                                                    <label for="gender-1">
                                                        <input type="radio" name="gender" id="gender-1" value="female">
                                                        Female
                                                    </label>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- Text input-->
                                        <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker.min.css" />
                                        <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker3.min.css" />

                                        <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.min.js">
                                            
                                        </script>


                                        <div class="form-group">
                                            <label class="col-md-4 control-label" for="gender">Date of Birth</label>
                                            <div class="col-md-4 date">
                                                <div class="input-group input-append date" id="datePicker">
                                                    <input type="text" class="form-control" name="dob" placeholder="MM/DD/YYYY" />
                                                    <span class="input-group-addon add-on"><span class="glyphicon glyphicon-calendar"></span></span>
                                                </div>
                                            </div>
                                        </div>

                                        <script>
                                            $(document).ready(function () {
                                                $('#datePicker')
                                                        .datepicker({
                                                            format: 'yyyy-mm-dd'
                                                        })
                                                        .on('changeDate', function (e) {
                                                            // Revalidate the date field
                                                            $('#eventForm').formValidation('revalidateField', 'date');
                                                        });

                                                $('#eventForm').formValidation({
                                                    framework: 'bootstrap',
                                                    icon: {
                                                        valid: 'glyphicon glyphicon-ok',
                                                        invalid: 'glyphicon glyphicon-remove',
                                                        validating: 'glyphicon glyphicon-refresh'
                                                    },
                                                    fields: {
                                                        name: {
                                                            validators: {
                                                                notEmpty: {
                                                                    message: 'The name is required'
                                                                }
                                                            }
                                                        },
                                                        date: {
                                                            validators: {
                                                                notEmpty: {
                                                                    message: 'The date is required'
                                                                },
                                                                date: {
                                                                    format: 'MM/DD/YYYY',
                                                                    message: 'The date is not a valid'
                                                                }
                                                            }
                                                        }
                                                    }
                                                });
                                            });
                                        </script>

                                        <!-- Text input-->
                                        <div class="form-group">
                                            <label class="col-md-4 control-label" for="no">Postal Address</label>  
                                            <div class="col-md-5">
                                                <input id="no" name="no" type="text" placeholder="Address1" class="form-control input-md" required="">

                                            </div>
                                        </div>

                                        <!-- Text input-->
                                        <div class="form-group">
                                            <label class="col-md-4 control-label" for="add2"></label>  
                                            <div class="col-md-5">
                                                <input id="add2" name="add2" type="text" placeholder="Address 2" class="form-control input-md">
                                                        </div>
                                        </div>

                                        <!-- Text input-->
                                        <div class="form-group">
                                            <label class="col-md-4 control-label" for="city"></label>  
                                            <div class="col-md-2">
                                                <input id="city" name="city" type="text" placeholder="City" class="form-control input-md">

                                            </div>
                                        </div>

                                        <!-- Text input-->
                                        <div class="form-group">
                                            <label class="col-md-4 control-label" for="zipcode"></label>  
                                            <div class="col-md-2">
                                                <input id="zipcode" name="zipcode" type="text" placeholder="Zip Code" class="form-control input-md">

                                            </div>
                                        </div>

                                        <!-- Select Basic -->
                                        <div class="form-group">
                                            <label class="col-md-4 control-label" for="country"></label>
                                            <div class="col-md-4">
                                                <select id="country" name="country" class="form-control">
                                                    <option value="Sri lanka">Sri lanka</option>
                                                    <option value="2">Option two</option>
                                                </select>
                                            </div>
                                        </div>

                                        <!-- Text input-->
                                        <div class="form-group">
                                            <label class="col-md-4 control-label" for="contact_no">Contact No</label>  
                                            <div class="col-md-2">
                                                <input id="contact_no" name="contact_no" type="tel" pattern="[0-9]{10}"  placeholder="" class="form-control input-md" required="">

                                            </div>
                                        </div>

                                        <!-- Text input-->
                                        <div class="form-group">
                                            <label class="col-md-4 control-label" for="email">Email</label>  
                                            <div class="col-md-5">
                                                <input id="email" name="email" type="text" placeholder="" class="form-control input-md" required="">

                                            </div>
                                        </div>
                                     
                                        <div class="form-group  ">
                                            <label class="col-md-4 control-label" >Upload a picture</label> 
                                            <img id="output" style="width: 200px; height: 200px; " src="image/default-user.png"/>
                                            
                              

                                            <div id="upFile" class="btn btn-primary">
                                                <span>Select</span>

                                                <!--<input type="file"  onchange="loadFile(event)" name="image" class="upload"  required="" >-->
                                                <input type="file" accept="image/*" onchange="loadFile(event)"  name='image' class="upload" required="required">

                                            </div>
                                            <!--<a href="#" class="btn btn-danger" onchange="deleteimage()"><span class="glyphicon glyphicon-trash"></span> </a>-->
                                            
                                            <script>
                                                var loadFile = function (event) {
                                                    var reader = new FileReader();
                                                    reader.onload = function () {
                                                        var output = document.getElementById('output');

                                                        output.src = reader.result;
                                                    };
                                                    reader.readAsDataURL(event.target.files[0]);
                                                };

                                                function deleteimage() {
                                                    $("#output").remove();
                                                }


                                            </script>

                                        </div>


                                        <!--upload image-->


                                    </div>
                                    <ul class="list-inline pull-right">
                                    <li><button  type="submit" class="btn btn-primary ">Save and continue</button></li>
                                </ul>
                                </form>