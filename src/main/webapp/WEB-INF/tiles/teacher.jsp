<script type="text/javascript">

    var populateDataForUpDate;

    // id to name mapping start
    var allUniversityName = [];
    getAllUniversityName();
    function getAllUniversityName(){
        $.post("view-all-university", function (data) {
            allUniversityName = data;
        })
    } // id to name mapping end

    // id to name mapping start
    var allUniversityFacultyName = [];
    getAllUniversityFacultyName();
    function getAllUniversityFacultyName(){
        $.post("view-all-department-type", function (data) {
            allUniversityFacultyName = data;
        })
    } // id to name mapping end

    // id to name mapping start
    var allUniversityFacultyAbbreviation = [];
    getAllUniversityFacultyAbbreviation();
    function getAllUniversityFacultyAbbreviation(){
        $.post("view-all-department-type", function (data) {
            allUniversityFacultyAbbreviation = data;
        })
    } // id to name mapping end

    // id to name mapping start
    var allUniversityDepartmentAbbreviation = [];
    getAllUniversityDepartmentAbbreviation();
    function getAllUniversityDepartmentAbbreviation(){
        $.post("view-all-department-type", function (data) {
            allUniversityDepartmentAbbreviation = data;
        })
    } // id to name mapping end

    // id to name mapping start
    var allUniversityDepartmentName = [];
    getAllUniversityDepartmentName();
    function getAllUniversityDepartmentName(){
        $.post("view-all-department-type", function (data) {
            allUniversityDepartmentName = data;
        })
    } // id to name mapping end

    // id to name mapping start
    var allUniversityType = [];
    getAllUniversityType();
    function getAllUniversityType(){
        $.post("view-all-university-type", function (data) {
            allUniversityType = data;
        })
    } // id to name mapping end

    /*Start Ready Function*/
    $(document).ready(function () {
        $("#successMessage").addClass("d-none");
        $("#errorMessage").addClass("d-none");

        $("#divAddTeacherInformation" ).show();
        $("#divShowTeacherInformation").hide();

        var teacherInformationCommon = [];
        funViewTeacherData();
        $("#tmpId").val(0);

        // start for data in combobox
        $.post("view-all-university-type", function(data){

            var universityTypeComboBox = '<select id="universityTypeCombo" class="form-control">';
            for(var key in data)
            {
                universityTypeComboBox += '<option value="' + data[key].id + '">' +data[key].uniVersityType+ '</option>';
            }
            universityTypeComboBox += '</select>';

            $("#divTeacherCurrentVarsityType").html(universityTypeComboBox);

        }); // end for data in combobox

        $.post("view-all-university", function (data) {

            var universityNameComboBox = '<select id="universityNameCombo" class="form-control">';
            for (var key in data) {
                universityNameComboBox += '<option value="' + data[key].id + '">' + data[key].varsityName + '</option>';
            }
            universityNameComboBox += '</select>';

            $("#divTeacherCurrentVarsity").html(universityNameComboBox);
            //alert(JSON.stringify(brandmodelComboBox));

        }); // end for data in combobox

        $.post("view-all-department-type", function (data) {

            var departmentNameComboBox = '<select id="departmentNameCombo" class="form-control">';
            for (var key in data) {
                departmentNameComboBox += '<option value="' + data[key].id + '">' + data[key].departmentName + '</option>';
            }
            departmentNameComboBox += '</select>';

            $("#divDepartmentType").html(departmentNameComboBox);
            //alert(JSON.stringify(brandmodelComboBox));

        }); // end for data in combobox

        $.post("view-all-department-type", function (data) {

            var departmentAbbreviationComboBox = '<select id="departmentAbbreviationCombo" class="form-control">';
            for (var key in data) {
                departmentAbbreviationComboBox += '<option value="' + data[key].id + '">' + data[key].departmentNickname + '</option>';
            }
            departmentAbbreviationComboBox += '</select>';

            $("#divDepartmentAbreviation").html(departmentAbbreviationComboBox);
            //alert(JSON.stringify(brandmodelComboBox));

        }); // end for data in combobox

        $.post("view-all-department-type", function (data) {

            var facultyNameComboBox = '<select id="facultyNameCombo" class="form-control">';
            for (var key in data) {
                facultyNameComboBox += '<option value="' + data[key].id + '">' + data[key].facultyName + '</option>';
            }
            facultyNameComboBox += '</select>';

            $("#divFacultyType").html(facultyNameComboBox);
            //alert(JSON.stringify(brandmodelComboBox));

        }); // end for data in combobox

        $.post("view-all-department-type", function (data) {

            var facultyAbbreviationComboBox = '<select id="facultyAbbreviationCombo" class="form-control">';
            for (var key in data) {
                facultyAbbreviationComboBox += '<option value="' + data[key].id + '">' + data[key].facultyNickname + '</option>';
            }
            facultyAbbreviationComboBox += '</select>';

            $("#divFacultyAbreviation").html(facultyAbbreviationComboBox);
            //alert(JSON.stringify(brandmodelComboBox));

        }); // end for data in combobox

        // validation checking start
        function validator() {
            var teacherName = $.trim($("#teacherName").val());
            var teacherEmail = $.trim($("#teacherEmail").val());
            var teacherVarsityType = $.trim($("#universityTypeCombo").val());
            var teacherCurrentVarsity = $.trim($("#universityNameCombo").val());
            var teacherSkill = $.trim($("#teacherSkill").val());
            var teacherAchievement = $.trim($("#teacherAchievement").val());
            var teacherProfileLink = $.trim($("#teacherProfileLink").val());
            var teacherFacultyName = $.trim($("#facultyNameCombo").val());
            var teacherFacultyAbbreviation = $.trim($("#facultyAbbreviationCombo").val());
            var teacherDepartmentName = $.trim($("#departmentNameCombo").val());
            var teacherDepartmentAbbreviation = $.trim($("#departmentAbbreviationCombo").val());
            var teacherGraduation = $.trim($("#teacherGraduation").val());

            if (teacherName == ""){
                $("#errorMessage").html("Please enter a valid teacher name !!");
                $("#errorMessage").removeClass("d-none");
                $("#successMessage").addClass("d-none");
                return false;
            }
            else if (teacherProfileLink == ""){
                $("#errorMessage").html("Please enter a valid teacher profile link !!");
                $("#errorMessage").removeClass("d-none");
                $("#successMessage").addClass("d-none");
                return false;
            }
            else if (teacherFacultyName == ""){
                $("#errorMessage").html("Please enter a valid teacher faculty name !!");
                $("#errorMessage").removeClass("d-none");
                $("#successMessage").addClass("d-none");
                return false;
            }
            else if (teacherFacultyAbbreviation == ""){
                $("#errorMessage").html("Please enter a valid teacher faculty abbreviation !!");
                $("#errorMessage").removeClass("d-none");
                $("#successMessage").addClass("d-none");
                return false;
            }
            else if (teacherDepartmentName == ""){
                $("#errorMessage").html("Please enter a valid teacher department name !!");
                $("#errorMessage").removeClass("d-none");
                $("#successMessage").addClass("d-none");
                return false;
            }
            else if (teacherDepartmentAbbreviation == ""){
                $("#errorMessage").html("Please enter a valid teacher department abbreviation !!");
                $("#errorMessage").removeClass("d-none");
                $("#successMessage").addClass("d-none");
                return false;
            }
            else if (teacherEmail == ""){
                $("#errorMessage").html("Please enter a valid teacher email !!");
                $("#errorMessage").removeClass("d-none");
                $("#successMessage").addClass("d-none");
                return false;
            }
            else if (teacherSkill == ""){
                $("#errorMessage").html("Please enter a valid teacher skill !!");
                $("#errorMessage").removeClass("d-none");
                $("#successMessage").addClass("d-none");
                return false;
            }
            else if (teacherAchievement == ""){
                $("#errorMessage").html("Please enter a valid teacher achievement !!");
                $("#errorMessage").removeClass("d-none");
                $("#successMessage").addClass("d-none");
                return false;
            }
            else if (teacherVarsityType == ""){
                $("#errorMessage").html("Please enter a valid teacher versity type !!");
                $("#errorMessage").removeClass("d-none");
                $("#successMessage").addClass("d-none");
                return false;
            }
            else if (teacherCurrentVarsity == ""){
                $("#errorMessage").html("Please enter a valid teacher current versity !!");
                $("#errorMessage").removeClass("d-none");
                $("#successMessage").addClass("d-none");
                return false;
            }
            else if (teacherGraduation == ""){
                $("#errorMessage").html("Please enter a valid teacher graduation !!");
                $("#errorMessage").removeClass("d-none");
                $("#successMessage").addClass("d-none");
                return false;
            }
            return true;

        } // validation checking end

        // submitting form to controller
        $("#btnSaveTeacher").click(function (event) {
            alert("clcik me");
            event.preventDefault();

            if (validator()){
                var teacher = {};

                teacher ["tmpId"] = $.trim($("#tmpId").val());
                teacher ["name"] = $.trim($("#teacherName").val());
                teacher ["email"] = $.trim($("#teacherEmail").val());
                teacher ["fkUniversityType"] = $.trim($("#universityTypeCombo").val());
                teacher ["fkUniversityName"] = $.trim($("#universityNameCombo").val());
                teacher ["graduation"] = $.trim($("#teacherGraduation").val());
                teacher ["skill"] = $.trim($("#teacherSkill").val());
                teacher ["achievement"] = $.trim($("#teacherAchievement").val());
               /* teacher ["photo"] = $.trim($("#teacherImage").val());*/
                teacher ["link"] = $.trim($("#teacherProfileLink").val());
                teacher ["fkFacultyName"] = $.trim($("#facultyNameCombo").val());
                teacher ["fkFacultyAbbreviation"] = $.trim($("#facultyAbbreviationCombo").val());
                teacher ["fkDepartmentName"] = $.trim($("#departmentNameCombo").val());
                teacher ["fkDepartmentAbbreviation"] = $.trim($("#departmentAbbreviationCombo").val());

                alert(JSON.stringify(teacher));

                $.ajax({
                    type : "POST",
                    url : "save-teacher",
                    data : JSON.stringify(teacher),
                    contentType : "application/json; charset utf-8",
                    success : function (successData) {
                        $("#successMessage").html(successData);
                        $("#successMessage").removeClass("d-none");
                        $("#errorMessage").addClass("d-none");

                        funViewTeacherData();
                        $("#tmpId").val(0);
                        tempDiv();
                    },
                    error: function (error) {
                        $("#errorMessage").html("Error: Record Not Saved");
                        $("#errorMessage").removeClass("d-none");
                        $("#successMessage").addClass("d-none");
                        tempDiv();
                    }
                });
            }
        }); // end of form submission

        // function for viewing existing data
        function funViewTeacherData() {
            $.post("view-all-teacher",function (data) {
                var teacherData = '<table id="tblTeacher" class="table table-striped">' + '<thead style="background-color: #0097A7;color: #fff;font-style: italic;text-align: center;"><tr><th>ID</th><th>Teacher Name</th><th>Email</th><th>Current University</th><th>University Type</th><th>Faculty Name</th><th>Faculty Abbreviation </th><th>Department Name</th><th>Department Abbreviation</th><th>Skill</th><th>Graduation</th><th>Achievement</th><th>Link</th><th>Action</th></tr></thead><tbody style="background-color: #ffe6e6;text-align:center;font-style: normal;">';

                for (var key in data) {

                    var teacherObject = {"id":[],"name":[],"email":[],"fkUniversityType":[],"fkUniversityName":[],"graduation":[],"skill":[],"achievement":[],"link":[],"fkFacultyName":[],"fkFacultyAbbreviation":[],"fkDepartmentName":[],"fkDepartmentAbbreviation":[]};

                    teacherObject["id"] = data[key].id;
                    teacherObject["name"] = data[key].name;
                    teacherObject["email"] = data[key].email;
                    teacherObject["fkUniversityType"] = data[key].fkUniversityType;
                    teacherObject["fkUniversityName"] = data[key].fkUniversityName;
                    teacherObject["graduation"] = data[key].graduation;
                    teacherObject["skill"] = data[key].skill;
                    teacherObject["achievement"] = data[key].achievement;
                    teacherObject["link"] = data[key].link;
                    teacherObject["fkFacultyName"] = data[key].fkFacultyName;
                    teacherObject["fkFacultyAbbreviation"] = data[key].fkFacultyAbbreviation;
                    teacherObject["fkDepartmentName"] = data[key].fkDepartmentName;
                    teacherObject["fkDepartmentAbbreviation"] = data[key].fkDepartmentAbbreviation;

                    teacherInformationCommon.push(teacherObject);

                    // id to name mapping start
                    var tmpUniversityName = allUniversityName.filter(obj =>{
                        return obj.id === data[key].fkUniversityName
                    }); // id to name mapping end

                    // id to name mapping end
                    var tmpUniversityType = allUniversityType.filter(obj =>{
                        return obj.id === data[key].fkUniversityType
                    }); // id to name mapping end

                    // id to name mapping start
                    var tmpUniversityFacultyName = allUniversityFacultyName.filter(obj =>{
                        return obj.id === data[key].fkFacultyName
                    }); // id to name mapping end

                    // id to name mapping start
                    var tmpUniversityFacultyAbbreviation = allUniversityFacultyAbbreviation.filter(obj =>{
                        return obj.id === data[key].fkFacultyName
                    }); // id to name mapping end

                    // id to name mapping start
                    var tmpUniversityDepartmentAbbreviation = allUniversityDepartmentAbbreviation.filter(obj =>{
                        return obj.id === data[key].fkFacultyName
                    }); // id to name mapping end

                    // id to name mapping start
                    var tmpUniversityDepartmentName = allUniversityDepartmentName.filter(obj =>{
                        return obj.id === data[key].fkFacultyName
                    }); // id to name mapping end

                    teacherData += '<tr><td>' + data[key].id +'</td><td>'+data[key].name+'</td><td>'+data[key].email+'</td><td>'+tmpUniversityName[0].varsityName+'</td><td>'+tmpUniversityType[0].uniVersityType+'</td><td>'+ tmpUniversityFacultyName[0].facultyName+'</td><td>'+tmpUniversityFacultyAbbreviation[0].facultyNickname+'</td><td>'+tmpUniversityDepartmentName[0].departmentName+'</td><td>'+tmpUniversityDepartmentAbbreviation[0].departmentNickname+'</td><td>'+data[key].skill+'</td><td>'+data[key].graduation+'</td><td>'+data[key].achievement+'</td><td>'+data[key].link+'</td><td> <a class=" btn btn-sm btn-success" id="btnUpdate_' + data[key].id + '" onclick="populateDataForUpdate(' + data[key].id + ')"><span class="far fa-fw fa-edit"></span> Edit</a></td></tr>';
                }
                teacherData += '</tbody></table>';
                $("#divTeacherInformation").html(teacherData);
                $("#tblTeacher").DataTable();

      });
  } // end of function for viewing existing data

        $( "#btnAddNewTeacher" ).click(function() {

            $("#divShowTeacherInformation").hide();
            $("#errorMessage").addClass("d-none");
            $("#divAddTeacherInformation" ).show();
        });

        $( "#btnShowTeacher" ).click(function() {

            $("#divAddTeacherInformation").hide();
            $("#errorMessage").addClass("d-none");
            $("#divShowTeacherInformation").show();
        });

        // edit button work in tha table start
        populateDataForUpdate = function(TeacherId){

            $("#divAddTeacherInformation" ).show();
            $("#divShowTeacherInformation").hide();

            var data = teacherInformationCommon.filter(obj => {
                return obj.id === TeacherId
            });

            $("#btnSaveTeacher").html("Update");

            $("#btnSaveTeacher").click(function () {
                $("#divAddTeacherInformation" ).hide();
                $("#divShowTeacherInformation").show();
            });

            $("#tmpId").val(data[0].id);
            $("#teacherName").val(data[0].name);
            $("#teacherEmail").val(data[0].email);
            $("#universityTypeCombo").val(data[0].fkUniversityType);
            $("#universityNameCombo").val(data[0].fkUniversityName);
            $("#facultyNameCombo").val(data[0].fkFacultyName);
            $("#facultyAbbreviationCombo").val(data[0].fkFacultyAbbreviation);
            $("#departmentNameCombo").val(data[0].fkDepartmentName);
            $("#departmentAbbreviationCombo").val(data[0].fkDepartmentAbbreviation);
            $("#teacherSkill").val(data[0].skill);
            $("#teacherGraduation").val(data[0].graduation);
            $("#teacherAchievement").val(data[0].achievement);
            $("#teacherProfileLink").val(data[0].link);

        }// edit button work in tha table end

        function tempDiv(){
            $("#successMessage").fadeTo(2000, 500).slideUp(500, function(){
                $("#successMessage").slideUp(500);
            });
            $("#errorMessage").fadeTo(2000, 500).slideDown(500, function(){
                $("#errorMessage").slideDown(500);
            });
        }
    }); /*End Ready Function*/

</script>

<div class="col-md-12" id="divAddTeacherInformation">
<main class="content">

        <!-------------------------------------------------->
        <div class="clearfix">

                <button id="btnShowTeacher" class="btn btn-primary" style="float: right; margin-right: 0%;margin-bottom: 3%;"><i data-feather="eye"></i>&nbsp;View Teacher</button>

            <h1 class="h3 mb-3">Teacher Information</h1>
        </div>
        <!-------------------------------------------------->
    <div class="container-fluid p-0">
        <div class="row">
            <div id="create-new-teacherForm" class="col-12"><!--  col-md-6 -->
                <div class="card">
                    <div class="card-header">
                        <h5 class="card-title">Create New Teacher Form</h5>
                        <h6 class="card-subtitle text-muted">This table is for all teacher information</h6>
                    </div>
                    <div class="card-body">
                        <form >
                            <fieldset>

                                <div class="well well-sm" id="successMessage" style="background-color:#1D9B2A; color:#fff;"></div>
                                <div class="well well-sm" id="errorMessage" style="background-color:red; color:#fff;"></div>

                                <input class="d-none" type="text" id="tmpId" name="tmpId" value="0" readonly="readonly">
                                <!-- class="hidden" -->

                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="teacherName">Teacher Name :</label>
                                        <input id="teacherName" name="teacherName" placeholder="Enter Teacher Name" class="form-control input-md" type="text">
                                    </div>

                                    <div class="form-group col-md-6">
                                        <label for="teacherEmail">Teacher's Email :</label>
                                        <input id="teacherEmail" name="teacherEmail" placeholder="Enter Teacher's Email" class="form-control input-md" type="text">
                                    </div>

                                    <div class="form-group col-md-5">
                                        <div class="form-group purple-border">
                                            <label for="divTeacherCurrentVarsityType">Teacher's University Type :</label>
                                            <div id="divTeacherCurrentVarsityType"></div>
                                        </div>
                                    </div>

                                    <div class="form-group col-md-7">
                                        <div class="form-group purple-border">
                                            <label for="divTeacherCurrentVarsity">Teacher's Current University :</label>
                                            <div id="divTeacherCurrentVarsity"></div>
                                        </div>
                                    </div>

                                    <div class="form-group col-md-8">
                                        <label for="divFacultyType">Teacher's Faculty Name :</label>
                                        <div id="divFacultyType"></div>
                                    </div>

                                    <div class="form-group col-md-4">
                                        <label for="divFacultyAbreviation">Teacher's Faculty Abbreviation :</label>
                                        <div id="divFacultyAbreviation"></div>
                                    </div>

                                    <div class="form-group col-md-8">
                                        <label for="divDepartmentType">Teacher's Department Name :</label>
                                        <div id="divDepartmentType"></div>
                                    </div>

                                    <div class="form-group col-md-4">Teacher's Department Abbreviation :</label>
                                        <div id="divDepartmentAbreviation"></div>
                                    </div>


                                    <div class="form-group col-md-12">
                                        <div class="form-group purple-border">
                                            <label for="teacherSkill">Teacher's Skill :</label>
                                            <textarea class="form-control" id="teacherSkill" placeholder="Enter Teacher's Skill" rows="5"></textarea>
                                        </div>
                                    </div>

                                    <div class="form-group col-md-12">
                                        <div class="form-group purple-border">
                                            <label for="teacherGraduation">Teacher's Graduation :</label>
                                            <textarea class="form-control" id="teacherGraduation" placeholder="Enter Teacher's Graduation" rows="5"></textarea>
                                        </div>
                                    </div>

                                    <div class="form-group col-md-12">
                                        <div class="form-group purple-border">
                                            <label for="teacherAchievement">Teacher's Achievement :</label>
                                            <textarea class="form-control" id="teacherAchievement" placeholder="Enter Teacher's Achievement" rows="5"></textarea>
                                        </div>
                                    </div>

                                    <div class="form-group col-md-12">
                                        <div class="form-group purple-border">
                                            <label for="teacherProfileLink">Teacher's Profile Link :</label>
                                            <textarea class="form-control" id="teacherProfileLink" placeholder="Enter Teacher's Profile Link" ></textarea>
                                        </div>
                                    </div>

                                    <div class="form-group col-md-6">
                                        <div class="input-group">
                                            <div class="input-group-prepend">
                                                 <span class="input-group-text" id="uploadTeacherImage">Upload</span>
                                            </div>
                                            <div class="custom-file">
                                                <input type="file" multiple  class="custom-file-input" id="teacherImage"
                                                       aria-describedby="uploadTeacherImage">
                                                <label class="custom-file-label" for="teacherImage">Choose Image file</label>
                                            </div>

                                            </div>
                                            <%--<form action="/upload" method="post" enctype="multipart/form-data">
                                                <input type="file" name="files" multiple>
                                                <input type="submit" value="Upload Files">

                                            </form>--%>
                                </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="btnSaveTeacher"></label>
                                    <div class="col-md-7">
                                        <button id="btnSaveTeacher" name="btnSaveTeacher" class="btn btn-primary">Save</button>
                                        <button id="btnSaveReset" name="btnSaveReset" class="btn btn-warning" type="reset" value="reset">Reset</button>
                                    </div>
                                </div>

                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </div><!-- //// -->
    </div>
</main>
</div>
<div class="col-md-12" id="divShowTeacherInformation">
<main  >
    <!-------------------------------------------------->
    <div class="clearfix">

        <button id="btnAddNewTeacher" class="btn btn-primary" style="float: right; margin-right: 0%;margin-bottom: 3%;"><i data-feather="plus"></i>&nbsp;Add Teacher</button>

        <h1 class="h3 mb-3">Teacher Information</h1>
    </div>
    <!-------------------------------------------------->
    <div class="container-fluid p-0">
    <div class="row">
        <div id="existing-teacherInformation" class="col-12">
            <div class="card">
                <div class="card-header">
                    <h5 class="card-title">Existing Teacher Information</h5>
                    <h6 class="card-subtitle text-muted">This table is for all teacher information</h6>
                </div>
                <div class="card-body">
                    <div id="divTeacherInformation"></div>
                </div>
            </div>
        </div>
    </div>
    </div>
</main>
</div>