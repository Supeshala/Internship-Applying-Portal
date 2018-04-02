<%-- 
    Document   : Edu_qucftion
    Created on : Nov 24, 2017, 11:17:06 AM
    Author     : tt2017071
--%>

<form class="form-horizontal" action="EduDetails" method="post">
    <fieldset>

        <!-- Form Name -->
        <legend>Educational Qualifications</legend>
        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-4 control-label" for="edu_level">Educational Level</label>
            <div class="col-md-4">
                <select id="edu_level" name="edu_level" class="form-control">
                    <option value="1">Degree</option>
                    <option value="2">Higher Diploma</option>
                    <option value="3">Advanced Diploma</option>
                    <option value="4">Certifications</option>
                </select>
            </div>
        </div>
        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-4 control-label" for="uni_name">University / Institute Name</label>  
            <div class="col-md-5">
                <input id="uni_name" name="uni_name" type="text" placeholder="" class="form-control input-md" required="">

            </div>
        </div>

        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-4 control-label" for="uni_address">Address</label>  
            <div class="col-md-5">
                <input id="uni_address" name="uni_address" type="text" placeholder="" class="form-control input-md" required="">

            </div>
        </div>

        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-4 control-label" for="uni_course">Course</label>  
            <div class="col-md-5">
                <input id="uni_course" name="uni_course" type="text" placeholder="" class="form-control input-md" required="">

            </div>
        </div>

        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-4 control-label" for="uni_startedDate">started Date</label>  
            <div class="col-md-2 date">
                <div class="input-group input-append date" id="datePicker1">
                    <input type="text" class="form-control" name="date" />
                    <span class="input-group-addon add-on"><span class="glyphicon glyphicon-calendar"></span></span>
                </div>
            </div>
        </div>

    </fieldset>

    <form class="form-horizontal">
        <fieldset>

            <!-- Form Name -->
            <legend>Academic Qualifications</legend>

            <div class="form-group">
                <label>
                    GCE  O/L<span class="req"></span>

                </label>

                <div>
                    <div class="col-md-4 col-md-offset-2">
                        <table>
                            <thead>
                            <th rowspan="3">Subject</th>

                            <th>Grade</th>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><input type="text" placeholder="Subject" name="sub1" class="form-control" autocomplete="off" /></td>

                                    <td>
                                        <select class="form-control" id="sel1" name="mark1">
                                            <option>select</option>
                                            <option>A</option>
                                            <option>B</option>
                                            <option>C</option>
                                            <option>S</option>
                                            <option>F</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td><input type="text" placeholder="Subject" name="sub2" class="form-control" autocomplete="off" /></td>

                                    <td>
                                        <select class="form-control" id="sel1" name="mark2">
                                            <option>select</option>
                                            <option>A</option>
                                            <option>B</option>
                                            <option>C</option>
                                            <option>S</option>
                                            <option>F</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td><input type="text" placeholder="Subject" name="sub3" class="form-control" autocomplete="off" /></td>

                                    <td>
                                        <select class="form-control" id="sel1" name="mark3">
                                            <option>select</option>
                                            <option>A</option>
                                            <option>B</option>
                                            <option>C</option>
                                            <option>S</option>
                                            <option>F</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td><input type="text" placeholder="Subject" name="sub4" class="form-control" autocomplete="off" /></td>

                                    <td>
                                        <select class="form-control" id="sel1" name="mark4">
                                            <option>select</option>
                                            <option>A</option>
                                            <option>B</option>
                                            <option>C</option>
                                            <option>S</option>
                                            <option>F</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td><input type="text" placeholder="Subject" name="sub5" class="form-control" autocomplete="off" /></td>

                                    <td>
                                        <select class="form-control" id="sel1" name="mark5">
                                            <option>select</option>
                                            <option>A</option>
                                            <option>B</option>
                                            <option>C</option>
                                            <option>S</option>
                                            <option>F</option>
                                        </select>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="col-md-5 col-md-offset-1">
                        <table>
                            <thead>
                            <th rowspan="3">Subject</th>

                            <th>Grade</th>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><input type="text" placeholder="Subject" name="sub6" class="form-control" autocomplete="off" /></td>

                                    <td>
                                        <select class="form-control" id="sel1" name="mark6">
                                            <option>select</option>
                                            <option>A</option>
                                            <option>B</option>
                                            <option>C</option>
                                            <option>S</option>
                                            <option>F</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td><input type="text" placeholder="Subject" name="sub7"class="form-control" autocomplete="off" /></td>

                                    <td>
                                        <select class="form-control" id="sel1" name="mark8">
                                            <option>select</option>
                                            <option>A</option>
                                            <option>B</option>
                                            <option>C</option>
                                            <option>S</option>
                                            <option>F</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td><input type="text" placeholder="Subject" name="sub8" class="form-control" autocomplete="off" /></td>

                                    <td>
                                        <select class="form-control" id="sel1" name="mark8">
                                            <option>select</option>
                                            <option>A</option>
                                            <option>B</option>
                                            <option>C</option>
                                            <option>S</option>
                                            <option>F</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td><input type="text" placeholder="Subject" name="sub9" class="form-control" autocomplete="off" /></td>

                                    <td>
                                        <select class="form-control" id="sel1" name="mark9">
                                            <option>select</option>
                                            <option>A</option>
                                            <option>B</option>
                                            <option>C</option>
                                            <option>S</option>
                                            <option>F</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td><input type="text" placeholder="Subject" name="sub10" class="form-control" autocomplete="off" /></td>

                                    <td>
                                        <select class="form-control" id="sel1" name="mark10">
                                            <option>select</option>
                                            <option>A</option>
                                            <option>B</option>
                                            <option>C</option>
                                            <option>S</option>
                                            <option>F</option>
                                        </select>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>


                </div>

                <br>
                <br>
            </div>

            <div class="form-group">
                <label>
                    GCE  A/L<span class="req"></span>

                </label>

                <div class="col-md-12">
                    <div class="col-md-4 col-md-offset-2">
                        <table>
                            <thead>
                            <th rowspan="3">Subject</th>

                            <th>Grade</th>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><input type="text" placeholder="Subject" name="Asub1" class="form-control" autocomplete="off" /></td>

                                    <td>
                                        <select class="form-control" id="sel1" name="Amark1">
                                            <option>select</option>
                                            <option>A</option>
                                            <option>B</option>
                                            <option>C</option>
                                            <option>S</option>
                                            <option>F</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td><input type="text" placeholder="Subject" name="Asub2"class="form-control" autocomplete="off" /></td>

                                    <td>
                                        <select class="form-control" id="sel1" name="Amark2">
                                            <option>select</option>
                                            <option>A</option>
                                            <option>B</option>
                                            <option>C</option>
                                            <option>S</option>
                                            <option>F</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td><input type="text" placeholder="Subject" name="Asub3" class="form-control" autocomplete="off" /></td>

                                    <td>
                                        <select class="form-control" id="sel1" name="Amark3">
                                            <option>select</option>
                                            <option>A</option>
                                            <option>B</option>
                                            <option>C</option>
                                            <option>S</option>
                                            <option>F</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td><input type="text" placeholder="General English" name="Asub4" class="form-control" autocomplete="off" /></td>

                                    <td>
                                        <select class="form-control" id="sel1"name="Amark4">
                                            <option>select</option>
                                            <option>A</option>
                                            <option>B</option>
                                            <option>C</option>
                                            <option>S</option>
                                            <option>F</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td><input type="text" placeholder="General Knowledge" name="Asub5" class="form-control" autocomplete="off" /></td>

                                    <td>
                                        <select class="form-control" id="sel1"name="Amark5">
                                            <option>select</option>
                                            <option>A</option>
                                            <option>B</option>
                                            <option>C</option>
                                            <option>S</option>
                                            <option>F</option>
                                        </select>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="col-md-6"></div>
                </div>


            </div>


            <!--***************************************-->
            <div class="form-group">
                <label class="col-md-4 control-label" for="textarea">Other Qualifications</label>
                <div class="col-md-4">                     
                    <textarea class="form-control" id="textarea" name="qualification"></textarea>
                </div>
            </div>

            <!-- Textarea -->
            <div class="form-group">
                <label class="col-md-4 control-label" for="textarea">Awards and Achievements</label>
                <div class="col-md-4">                     
                    <textarea class="form-control" id="textarea" name="award"></textarea>
                </div>
            </div>
            <ul class="list-inline pull-right">
                <li><button type="button" class="btn btn-default prev-step">Previous</button></li>
                <li><button type="submit" class="btn btn-primary" name="edu_update" value="save">Save and continue</button></li>
            </ul>
        </fieldset>
    </form>
    
    <script>
                                            $(document).ready(function () {
                                                $('#datePicker1')
                                                        .datepicker({
                                                            format: 'mm/dd/yyyy'
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