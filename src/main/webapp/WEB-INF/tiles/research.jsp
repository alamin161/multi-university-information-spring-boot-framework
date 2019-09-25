
<script type="text/javascript">

    var populateDataForUpDate;

    //id to name mapping start
    var allDepartmentAbbreviation = [];
    getAllDepartmentAbbreviation();
    function getAllDepartmentAbbreviation(){
        $.post("view-all-department-type", function (data) {
            allDepartmentAbbreviation = data;
        })
    }// id to name mapping end

    // id to name mapping start
    var allUniversityType = [];
    getAllUniversityType();
    function getAllUniversityType(){
        $.post("view-all-university-type", function (data) {
            allUniversityType = data
        })
    } // id to name mapping end

    // id to name mapping start
    var allUniversityName = [];
    getAllUniversityName();
    function getAllUniversityName(){
        $.post("view-all-university", function (data) {
            allUniversityName = data;
        })
    } // id to name mapping end

    // start ready function
    $(document).ready(function () {
        $("#successMessage").addClass("d-none");
        $("#errorMessage").addClass("d-none");

        $("#divAddResearch" ).show();
        $("#divShowResearch").hide();

        var researchInformationCommon = [];
        funViewResearchData();
        $("#tmpId").val(0);

        // start for data in combobox
        $.post("view-all-university-type", function(data){
            //alert(JSON.stringify(data));
            var universityTypeComboBox = '<select id="universityTypeCombo" class="form-control">';
            for(var key in data)
            {
                universityTypeComboBox += '<option value="' + data[key].id + '">' +data[key].uniVersityType+ '</option>';
            }
            universityTypeComboBox += '</select>';

            $("#divUniversityType").html(universityTypeComboBox);

            /*$("#universityTypeCombo").change(function () {
                getUniversityByUniType($(this).val());
            });*/
        }); // end for data in combobox

        // start for data in combobox
        $.post("view-all-department-type", function(data){
            //alert(JSON.stringify(data));
            var departmentTypeComboBox = '<select id="departmentTypeCombo" class="form-control">';
            for(var key in data)
            {
                departmentTypeComboBox += '<option value="' + data[key].id + '">' +data[key].departmentNickname+ '</option>';
            }
            departmentTypeComboBox += '</select>';

            $("#divDepartmentType").html(departmentTypeComboBox);

        }); // end for data in combobox

        //function getUniversityByUniType(universityTypeId) { view-university-by-university-type
            $.post("view-all-university", function (data) {
                //alert(JSON.stringify(data));
                var universityNameComboBox = '<select id="universityNameCombo" class="form-control">';
                for (var key in data) {
                    universityNameComboBox += '<option value="' + data[key].id + '">' + data[key].varsityName + '</option>';
                }
                universityNameComboBox += '</select>';

                $("#divUniversityName").html(universityNameComboBox);
                //alert(JSON.stringify(brandmodelComboBox));
            }); // end for data in combobox
        //}

        // Dependable combo box


        // validation checking start
        function  validator() {
            var researchName = $.trim($("#researchName").val());
            var varsityType = $.trim($("#universityTypeCombo").val());
            var varsityName = $.trim($("#universityNameCombo").val());
            var teacherName = $.trim($("#teacherName").val());
            var departmentNickname = $.trim($("#departmentTypeCombo").val());
            var researchPublishedDate = $.trim($("#researchPublishedDate").val());

            if (researchName == ""){
                $("#errorMessage").html("Please enter a valid research name !!");
                $("#errorMessage").removeClass("d-none");
                $("#successMessage").addClass("d-none");
                return false;
            }
            else if (varsityType == ""){
                $("#errorMessage").html("Please enter a valid varsity type !!");
                $("#errorMessage").removeClass("d-none");
                $("#successMessage").addClass("d-none");
                return false;
            }
            else if (varsityName == ""){
                $("#errorMessage").html("Please enter a valid varsity abbreviation !!");
                $("#errorMessage").removeClass("d-none");
                $("#successMessage").addClass("d-none");
                return false;
            }
            else if (teacherName == ""){
                $("#errorMessage").html("Please enter a valid teacher name !!");
                $("#errorMessage").removeClass("d-none");
                $("#successMessage").addClass("d-none");
                return false;
            }
            else if (departmentNickname == ""){
                $("#errorMessage").html("Please enter a valid department abbreviation !!");
                $("#errorMessage").removeClass("d-none");
                $("#successMessage").addClass("d-none");
                return false;
            }
            else if (researchPublishedDate == ""){
                $("#errorMessage").html("Please enter a valid research publish date !!");
                $("#errorMessage").removeClass("d-none");
                $("#successMessage").addClass("d-none");
                return false;
            }

            return true;

        } // validation checking end

        // submitting form to controller
        $("#btnSaveResearch").click(function (event) {
            alert("clcik me");
            event.preventDefault();

            $("#divAddResearch" ).hide();
            $("#divShowResearch").show();

            if (validator()){
                var research = {};

                research ["tmpId"] = $.trim($("#tmpId").val());
                research ["researchName"] = $.trim($("#researchName").val());
                research ["fkVarsityType"] = $.trim($("#universityTypeCombo").val());
                research ["fkVarsityName"] = $.trim($("#universityNameCombo").val());
                research ["teacherName"] = $.trim($("#teacherName").val());
                research ["fkDepartmentNickname"] = $.trim($("#departmentTypeCombo").val());
                research ["researchPublished"] = $.trim($("#researchPublishedDate").val());

                alert(JSON.stringify(research));

                $.ajax({
                    type : "POST",
                    url : "save-research",
                    data : JSON.stringify(research),
                    contentType : "application/json; charset utf-8",
                    success : function (successData) {
                        $("#successMessage").html(successData);
                        $("#successMessage").removeClass("d-none");
                        $("#errorMessage").addClass("d-none");

                        funViewResearchData();
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
        function funViewResearchData() {
            $.post("view-all-research",function (data) {
                var researchData = '<table id="tblResearch" class="table table-striped">' + '<thead style="background-color: #0097A7;color: #fff;font-style: italic;text-align: center;"><tr><th>ID</th><th>Research Name</th><th>University Type</th><th>University Name</th><th>Department Abbreviation</th><th>Teacher Name</th><th>Publication Date(YY-MM-DD)</th><th>Action</th></tr></thead><tbody style="background-color: #ffe6e6;text-align:center;font-style: normal;">';

                for (var key in data) {

                    var researchObject = {"id":[],"researchName":[],"fkVarsityType":[],"fkVarsityName":[],"fkDepartmentNickname":[],"teacherName":[],"researchPublished":[]};

                    researchObject["id"] = data[key].id;
                    researchObject["researchName"] = data[key].researchName;
                    researchObject["fkVarsityType"] = data[key].fkVarsityType;
                    researchObject["fkVarsityName"] = data[key].fkVarsityName;
                    researchObject["fkDepartmentNickname"] = data[key].fkDepartmentNickname;
                    researchObject["teacherName"] = data[key].teacherName;
                    researchObject["researchPublished"] = data[key].researchPublished;

                    researchInformationCommon.push(researchObject);

                    // id to name mapping start
                    var tmpUniversityName = allUniversityName.filter(obj =>{
                       return obj.id === data[key].fkVarsityName
                    }); // id to name mapping end

                    /*// id to name mapping start
                    var tmpAllDepartmentAbbreviation = allDepartmentAbbreviation.filter(obj =>{
                        return obj.id === data[key].fkDepartmentNickname
                    }); // id to name mapping end*/

                    // id  to name mapping start
                    var tmpUniversityType = allUniversityType.filter(obj =>{
                       return obj.id === data[key].fkVarsityType
                    });

                    researchData += '<tr><td>' + data[key].id + '</td><td>' +  data[key].researchName + '</td><td>' + tmpUniversityType[0].uniVersityType + '</td><td>' + tmpUniversityName[0].varsityName + '</td><td>' + data[key].fkDepartmentNickname + '</td><td>' + data[key].teacherName + '</td><td>' + data[key].researchPublished + '</td><td> <a class="btn btn-sm btn-success" id="btnUpdate_' + data[key].id + '" onclick="populateDataForUpdate(' + data[key].id + ')"><span class="far fa-fw fa-edit"></span> Edit</a></td></tr>';//glyphicon glyphicon-edit

                }
                researchData += '</tbody></table>';
                $("#divResearch").html(researchData);
                $("#tblResearch").DataTable();

            });
        } // end of function for viewing existing data

        $( "#btnAddNewResearch" ).click(function() {

            $("#divShowResearch").hide();
            $("#errorMessage").addClass("d-none");
            $("#divAddResearch" ).show();
        });

        $( "#btnShowResearch" ).click(function() {

            $("#divAddResearch").hide();
            $("#errorMessage").addClass("d-none");
            $("#divShowResearch").show();
        });

        // edit button work in tha table start
        populateDataForUpdate = function(ResearchId){

            $("#divAddResearch" ).show();
            $("#divShowResearch").hide();

            var data = researchInformationCommon.filter(obj => {
                return obj.id === ResearchId
            });

            $("#btnSaveResearch").html("Update");

            $("#btnSaveResearch").click(function () {
                $("#divAddResearch" ).hide();
                $("#divShowResearch").show();
            });

            $("#tmpId").val(data[0].id);
            $("#researchName").val(data[0].researchName);
            $("#universityTypeCombo").val(data[0].fkVarsityType);
            $("#universityNameCombo").val(data[0].fkVarsityName);
            $("#departmentTypeCombo").val(data[0].fkDepartmentNickname);
            $("#teacherName").val(data[0].teacherName);
            $("#researchPublished").val(data[0].researchPublished);

        }// edit button work in tha table end

        function tempDiv(){
            $("#successMessage").fadeTo(2000, 500).slideUp(500, function(){
                $("#successMessage").slideUp(500);
            });
            $("#errorMessage").fadeTo(2000, 500).slideDown(500, function(){
                $("#errorMessage").slideDown(500);
            });
        }

    }); // end of ready function


</script>

<div class="col-md-12" id="divAddResearch">
<main class="content">
    <div class="container-fluid p-0">
        <!-------------------------------------------------->
        <div class="clearfix">

                <button id="btnShowResearch" class="btn btn-primary" style="float: right; margin-right: 0%;margin-bottom: 3%;"><i data-feather="eye"></i>&nbsp;View Research</button>

            <h1 class="h3 mb-3">Research Form</h1>
        </div>
        <!-------------------------------------------------->
        <div class="row">
            <div id="create-new-achievement" class="col-12"><!--  col-md-6 -->
                <div class="card">
                    <div class="card-header">
                        <h5 class="card-title">Create New Research Form</h5>
                        <h6 class="card-subtitle text-muted">This table is for all research information</h6>
                    </div>
                    <div class="card-body">
                        <form >
                            <fieldset>

                                <div class="well well-sm" id="successMessage" style="background-color:#1D9B2A; color:#fff;"></div>
                                <div class="well well-sm" id="errorMessage" style="background-color:red; color:#fff;"></div>

                                <input class="d-none" type="text" id="tmpId" name="tmpId" value="0" readonly="readonly">
                                <!-- class="hidden" -->

                                <div class="form-row">
                                    <div class="form-group col-md-12">
                                        <label for="researchName">Research Name :</label>
                                        <input id="researchName" name="researchName" placeholder="Enter Research Name" class="form-control input-md" type="text">
                                    </div>

                                    <div class="form-group col-md-3">
                                        <label for="divUniversityType">University Type :</label>
                                        <div id="divUniversityType"></div>
                                    </div>

                                    <div class="form-group col-md-6">
                                        <label for="divUniversityName">University Name :</label>
                                        <div id="divUniversityName"></div>
                                    </div>

                                    <div class="form-group col-md-3">
                                        <label for="divDepartmentType">Department Abbreviation :</label>
                                        <div id="divDepartmentType"></div>
                                    </div>

                                    <div class="form-group col-md-12">
                                        <label for="teacherName">Teacher's Name :</label>
                                        <textarea class="form-control" id="teacherName" placeholder="Enter Teacher's Name" rows="3"></textarea>
                                    </div>
                                    <div class="form-group col-md-3">
                                        <label for="researchPublishedDate">Research Published Date :</label>
                                        <input id="researchPublishedDate" type="date" class="form-control">
                                    </div>

                                </div>

                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="btnSaveResearch"></label>
                                    <div class="col-md-7">
                                        <button id="btnSaveResearch" name="btnSaveResearch" class="btn btn-primary">Save</button>
                                        <button id="btnResetResearch" name="btnResetResearch" class="btn btn-warning" type="reset" value="reset">Reset</button>
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
<div class="col-md-12" id="divShowResearch">
    <main class="content">
        <!-------------------------------------------------->
        <div class="clearfix">

            <button id="btnAddNewResearch" class="btn btn-primary" style="float: right; margin-right: 0%;margin-bottom: 3%;"><i data-feather="eye"></i>&nbsp;Add New Research</button>

            <h1 class="h3 mb-3">Research Table Data</h1>
        </div>
        <!-------------------------------------------------->
        <div class="container-fluid p-0">
            <div class="row">
        <div id="existing-research" class="col-12">
            <div class="card">
                <div class="card-header">
                    <h5 class="card-title">Existing Research Information</h5>
                    <h6 class="card-subtitle text-muted">This table is for all research information</h6>
                </div>
                <div class="card-body">
                    <div id="divResearch"></div>
                </div>
            </div>
            </div>
        </div>
    </div>
</main>
</div>
