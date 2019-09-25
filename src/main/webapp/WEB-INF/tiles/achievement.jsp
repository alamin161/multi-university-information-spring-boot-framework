<script type="text/javascript">

    // id to name mapping start
    var allUniversityType = [];
    getAllUniversityType();
    function getAllUniversityType(){
        $.post("view-all-university-type",function (data) {
            allUniversityType = data;
        });
    } // id to name mapping end

    // id to name mapping start
    var allUniversityName = [];
    getAllUniversityName();
    function getAllUniversityName(){
        $.post("view-all-university",function (data) {
            allUniversityName = data;
        });
    } // id to name mapping end

    var populateDataForUpdate;

    // start ready function
    $(document).ready(function () {

        $("#successMessage").addClass("d-none");
        $("#errorMessage").addClass("d-none");

        $("#divAddAchievement" ).show();
        $("#divShowAchievement").hide();

        var achievementInformationCommon = [];
        funViewAchievementData();
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
            //alert(JSON.stringify(brandmodelComboBox));
        }); // end for data in combobox

        // start for data in combobox
        $.post("view-all-university", function(data){
            //alert(JSON.stringify(data));
            var universityNameComboBox = '<select id="universityNameCombo" class="form-control">';
            for(var key in data)
            {
                universityNameComboBox += '<option value="' + data[key].id + '">' +data[key].varsityName+ '</option>';
            }
            universityNameComboBox += '</select>';

            $("#divUniversityName").html(universityNameComboBox);
            //alert(JSON.stringify(brandmodelComboBox));
        }); // end for data in combobox

        // validation checking start
        function validator() {
            var achievementTitle = $.trim($("#achievementTitle").val());
            var varsityType = $.trim($("#universityTypeCombo").val());
            var varsityName = $.trim($("#universityNameCombo").val());
            var competitionPosition = $.trim($("#compititionPosition").val());
            var competitionTitle = $.trim($("#compititionTitle").val());
            var competitionPlace = $.trim($("#compititionPlace").val());
            var competitionDate = $.trim($("#compititionDate").val());

            if (achievementTitle == ""){
                $("#errorMessage").html("Please enter a valid achievement name !!");
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
                $("#errorMessage").html("Please enter a valid varsity name !!");
                $("#errorMessage").removeClass("d-none");
                $("#successMessage").addClass("d-none");
                return false;
            }
            else if (competitionPosition == ""){
                $("#errorMessage").html("Please enter a valid competition position !!");
                $("#errorMessage").removeClass("d-none");
                $("#successMessage").addClass("d-none");
                return false;
            }
            else if (competitionTitle == ""){
                $("#errorMessage").html("Please enter a valid competition title !!");
                $("#errorMessage").removeClass("d-none");
                $("#successMessage").addClass("d-none");
                return false;
            }
            else if (competitionPlace == ""){
                $("#errorMessage").html("Please enter a valid competition place !!");
                $("#errorMessage").removeClass("d-none");
                $("#successMessage").addClass("d-none");
                return false;
            }
            else if (competitionDate == ""){
                $("#errorMessage").html("Please enter a valid competition date !!");
                $("#errorMessage").removeClass("d-none");
                $("#successMessage").addClass("d-none");
                return false;
            }
            return true;

        } // validation checking end

        // submitting form to controller
        $("#btnSaveAchievement").click(function (event) {
            alert("clcik me");
            event.preventDefault();

            $("#divAddAchievement" ).hide();
            $("#divShowAchievement").show();

            if (validator()){
                var achievMent = {};

                achievMent ["tmpId"] = $.trim($("#tmpId").val());
                achievMent ["achievementTitle"] = $.trim($("#achievementTitle").val());
                achievMent ["fkVarsityType"] = $.trim($("#universityTypeCombo").val());
                achievMent ["fkVarsityName"] = $.trim($("#universityNameCombo").val());
                achievMent ["competitionPosition"] = $.trim($("#compititionPosition").val());
                achievMent ["competitionTitle"] = $.trim($("#compititionTitle").val());
                achievMent ["competitionPlace"] = $.trim($("#compititionPlace").val());
                achievMent ["competitionDate"] = $.trim($("#compititionDate").val());

                alert(JSON.stringify(achievMent));

                $.ajax({
                    type : "POST",
                    url : "save-achievement",
                    data : JSON.stringify(achievMent),
                    contentType : "application/json; charset utf-8",
                    success : function (successData) {
                        $("#successMessage").html(successData);
                        $("#successMessage").removeClass("d-none");
                        $("#errorMessage").addClass("d-none");

                        funViewAchievementData();
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
        function funViewAchievementData() {
            $.post("view-all-achievement",function (data) {
                var achievementData = '<table id="tblAchievement" class="table table-striped">' + '<thead style="background-color: #0097A7;color: #fff;font-style: italic;text-align: center;"><tr><th>ID</th><th>Achievement Title</th><th>University Type</th><th>University Name</th><th>Competition Position</th><th>Competition Title</th><th>Competition Place</th><th>Competition Date(YY-MM-DD)</th><th>Action</th></tr></thead><tbody style="background-color: #ffe6e6;text-align:center;font-style: normal;">';
                for (var key in data){

                    var achievementTypeObject = {"id":[],"achievementTitle":[],"fkVarsityType":[],"fkVarsityName":[],"competitionPosition":[],"competitionTitle":[],"competitionPlace":[],"ompetitionDate":[]};

                    achievementTypeObject["id"] = data[key].id;
                    achievementTypeObject["achievementTitle"] = data[key].achievementTitle;
                    achievementTypeObject["fkVarsityType"] = data[key].fkVarsityType;
                    achievementTypeObject["fkVarsityName"] = data[key].fkVarsityName;
                    achievementTypeObject["competitionPosition"] = data[key].competitionPosition;
                    achievementTypeObject["competitionTitle"] = data[key].competitionTitle;
                    achievementTypeObject["competitionPlace"] = data[key].competitionPlace;
                    achievementTypeObject["competitionDate"] = data[key].competitionDate;

                    achievementInformationCommon.push(achievementTypeObject);

                    // id to name mapping start
                    var tmpUniversityType = allUniversityType.filter(obj =>{
                        return obj.id === data[key].fkVarsityType

                    }); // id to name mapping end

                    // id to name mapping start
                    var tmpUniversityName = allUniversityName.filter(obj =>{
                        return obj.id === data[key].fkVarsityName

                    }); // id to name mapping end

                    achievementData += '<tr><td>' + data[key].id + '</td><td>' + data[key].achievementTitle + '</td><td>' + tmpUniversityType[0].uniVersityType + '</td><td>' + tmpUniversityName[0].varsityName + '</td><td>' + data[key].competitionPosition + '</td><td>' + data[key].competitionTitle + '</td><td>' + data[key].competitionPlace + '</td><td>' + data[key].competitionDate + '</td><td> <a class="btn btn-sm btn-success" id="btnUpdate_' + data[key].id + '" onclick="populateDataForUpdate(' + data[key].id + ')"><span class="far fa-fw fa-edit"></span> Edit</a></td></tr>';
                }
                achievementData += '</tbody></table>';

                $("#divAchievement").html(achievementData);
                $("#tblAchievement").DataTable();

            });
        } // end of function for viewing existing data

        $( "#btnAddNewAchievement" ).click(function() {

            $("#divShowAchievement").hide();
            $("#errorMessage").addClass("d-none");
            $("#divAddAchievement" ).show();

        });

        $( "#btnShowAchievement" ).click(function() {

            $("#divAddAchievement").hide();
            $("#errorMessage").addClass("d-none");
            $("#divShowAchievement").show();

        });

        // Start Table edit button work here for update
        populateDataForUpdate = function(achievementId){

            $("#divAddAchievement" ).show();
            $("#divShowAchievement").hide();

            var data = achievementInformationCommon.filter(obj => {
                return obj.id === achievementId
            });

            $("#btnSaveAchievement").html("Update");

            $("#btnSaveAchievement").click(function () {
                $("#divAddAchievement" ).hide();
                $("#divShowAchievement").show();
            });

            $("#tmpId").val(data[0].id);
            $("#achievementTitle").val(data[0].achievementTitle);
            $("#universityTypeCombo").val(data[0].fkVarsityType);
            $("#universityNameCombo").val(data[0].fkVarsityName);
            $("#compititionPosition").val(data[0].competitionPosition);
            $("#compititionTitle").val(data[0].competitionTitle);
            $("#compititionPlace").val(data[0].competitionPlace);
            $("#compititionDate").val(data[0].competitionDate);

        } // End Table edit button work here for update

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


<div class="col-md-12" id="divAddAchievement">
<main class="content">
    <div class="container-fluid p-0">
        <!-------------------------------------------------->
        <div class="clearfix">

                <button id="btnShowAchievement" class="btn btn-primary" style="float: right; margin-right: 0%;margin-bottom: 3%;"><i data-feather="eye"></i>&nbsp;View Achievement</button>

            <h1 class="h3 mb-3">Achievement Form</h1>
        </div>
        <!-------------------------------------------------->
        <div class="row">
            <div id="create-new-achievement" class="col-12"><!--  col-md-6 -->
                <div class="card">
                    <div class="card-header">
                        <h5 class="card-title">Create New Achievement Form</h5>
                        <h6 class="card-subtitle text-muted">This table is for all achievement information</h6>
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
                                        <label for="achievementTitle">Achievement Title :</label>
                                        <input id="achievementTitle" name="achievementTitle" placeholder="Enter Achievement Title" class="form-control input-md" type="text">
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
                                        <label for="compititionPosition">Compitition Position :</label>
                                        <input id="compititionPosition" name="compititionPosition" placeholder="Position Achieved" class="form-control input-md" type="text">
                                    </div>

                                    <div class="form-group col-md-12">
                                        <label for="compititionTitle">Compitition Title :</label>
                                        <input id="compititionTitle" name="compititionTitle" placeholder="Enter Compitition Title" class="form-control input-md" type="text">
                                    </div>

                                    <div class="form-group col-md-12">
                                        <label for="compititionPlace">Compitition Place :</label>
                                        <input id="compititionPlace" name="compititionPlace" placeholder="Enter Compitition Place" class="form-control input-md" type="text">
                                    </div>

                                    <div class="form-group col-md-3">
                                        <label for="compititionDate">Compitition Date :</label>
                                        <input id="compititionDate" type="date" class="form-control">
                                    </div>

                                </div>

                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="btnSaveAchievement"></label>
                                    <div class="col-md-7">
                                        <button id="btnSaveAchievement" name="btnSaveAchievement" class="btn btn-primary">Save</button>
                                        <button id="btnResetAchievement" name="btnResetAchievement" class="btn btn-warning" type="reset" value="reset">Reset</button>
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

<div class="col-md-12" id="divShowAchievement">
<main class="content">
        <div class="container-fluid p-0">
            <!-------------------------------------------------->
            <div class="clearfix">

                    <button id="btnAddNewAchievement" class="btn btn-primary" style="float: right; margin-right: 0%;margin-bottom: 3%;"><i data-feather="plus"></i>&nbsp;Add New Achievement</button>

                <h1 class="h3 mb-3">Achievement Form</h1>
            </div>
            <!-------------------------------------------------->
            <div class="row">
        <div id="existing-achievement" class="col-12">
            <div class="card">
                <div class="card-header">
                    <h5 class="card-title">Existing Achievement Information</h5>
                    <h6 class="card-subtitle text-muted">This table is for all achievement information</h6>
                </div>
                <div class="card-body">
                    <div id="divAchievement"></div>
                </div>
            </div>
        </div>
            </div>
    </div>
</main>
</div>