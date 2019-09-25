<script type="text/javascript">

    var populateDataForUpDate;

    // id to name mapping start
    var allUniversityType = [];
    getAllUniversityType();
    function getAllUniversityType(){
        $.post("view-all-university-type",function (data) {
            allUniversityType = data;
        });
    } // id to name mapping end

    /*Start Ready Function*/
    $(document).ready(function () {
        $("#successMessage").addClass("d-none");
        $("#errorMessage").addClass("d-none");

        var universityInformation = [];

        funViewUniversityData();
        $("#tmpId").val(0);

        $("#divAddNewUniversity" ).show();
        $("#divShowUniversity").hide();

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


        }); // end for data in combobox

        // validation checking start
        function validator() {
            var varsityName = $.trim($("#varsityName").val());
            var varsityNickName = $.trim($("#varsityNickname").val());
            var varsityType = $.trim($("#universityTypeCombo").val());
            var varsityCampus = $.trim($("#varsityCampus").val());

            if (varsityName == ""){
                $("#errorMessage").html("Please enter a valid varsity name !!");
                $("#errorMessage").removeClass("d-none");
                $("#successMessage").addClass("d-none");
                return false;
            }
            else if (varsityNickName == ""){
                $("#errorMessage").html("Please enter a valid varsity Nickname !!");
                $("#errorMessage").removeClass("d-none");
                $("#successMessage").addClass("d-none");
                return false;
            }
            else if (varsityType == ""){
                $("#errorMessage").html("Please enter a valid varsity Campus !!");
                $("#errorMessage").removeClass("d-none");
                $("#successMessage").addClass("d-none");
                return false;
            }
            else if (varsityCampus == ""){
                $("#errorMessage").html("Please enter a valid varsity Campus !!");
                $("#errorMessage").removeClass("d-none");
                $("#successMessage").addClass("d-none");
                return false;
            }
            return true;

        } // validation checking end

        // submitting form to controller
        $("#btnSaveUniVarsity").click(function (event) {
            alert("clcik me");
            event.preventDefault();

            $("#divAddNewUniversity" ).hide();
            $("#divShowUniversity").show();

            if (validator()){
                var uniVarsity = {};

                uniVarsity ["tmpId"] = $.trim($("#tmpId").val());
                uniVarsity ["varsityName"] = $.trim($("#varsityName").val());
                uniVarsity ["varsityNickname"] = $.trim($("#varsityNickname").val());
                uniVarsity ["fkUniversityType"] = $.trim($("#universityTypeCombo").val());
                uniVarsity ["campus"] = $.trim($("#varsityCampus").val());

                alert(JSON.stringify(uniVarsity));

                $.ajax({
                    type : "POST",
                    url : "save-university",
                    data : JSON.stringify(uniVarsity),
                    contentType : "application/json; charset utf-8",
                    success : function (successData) {
                        $("#successMessage").html(successData);
                        $("#successMessage").removeClass("d-none");
                        $("#errorMessage").addClass("d-none");

                        funViewUniversityData();
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
        function funViewUniversityData() {
            $.post("view-all-university",function (data) {
                var uniVersityData = '<table id="tblUniVarsity" class="table table-striped">' + '<thead style="background-color: #0097A7;color: #fff;font-style: italic;text-align: center;"><tr><th>ID</th><th>University Name</th><th>University Abbreviation</th><th>Campus</th><th>University Type</th><th>Action</th></tr></thead><tbody style="background-color: #ffe6e6;text-align:center;font-style: normal;">';
                // id to name mapping start
                for (var key in data){

                    // id to name mapping start
                    var tmpUniversityType = allUniversityType.filter(obj =>{
                        return obj.id === data[key].fkUniversityType

                    }); // id to name mapping end
                    // alert(JSON.stringify(tmpUniversityType));

                    var universityObject = {"id":[],"varsityName":[],"varsityNickname":[],"campus":[],"fkUniversityType":[]};

                    universityObject["id"] = data[key].id;
                    universityObject["varsityName"] = data[key].varsityName;
                    universityObject["varsityNickname"] = data[key].varsityNickname;
                    universityObject["campus"] = data[key].campus;
                    universityObject["fkUniversityType"] = data[key].fkUniversityType;

                    universityInformation.push(universityObject);

                    uniVersityData += '<tr><td>' + data[key].id + '</td><td>' + data[key].varsityName + '</td><td>' + data[key].varsityNickname + '</td><td>' + data[key].campus + '</td><td>' + tmpUniversityType[0].uniVersityType + '</td><td> <a class="btn btn-sm btn-success" id="btnUpdate_' + data[key].id + '" onclick="populateDataForUpdate(' + data[key].id + ')"><span class="far fa-fw fa-edit"></span> Edit</a></td></tr>';
                }
                uniVersityData += '</tbody></table>';
                $("#divUniversity").html(uniVersityData);
                $("#tblUniVarsity").DataTable();

            });
        } // end of function for viewing existing data

        $( "#btnAddNewUniversity" ).click(function() {

            $("#divShowUniversity").hide();
            $("#errorMessage").addClass("d-none");
            $("#divAddNewUniversity" ).show();

        });

        $( "#btnShowUniversity" ).click(function() {

            $("#divAddNewUniversity").hide();
            $("#errorMessage").addClass("d-none");
            $("#divShowUniversity").show();

        });

        // edit button work in tha table start
        populateDataForUpdate = function(UniversityId){

            $("#divAddNewUniversity" ).show();
            $("#divShowUniversity").hide();

            var data = universityInformation.filter(obj => {
                return obj.id === UniversityId
            });

            $("#btnSaveUniVarsity").html("Update");

            $("btnSaveUniVarsity").click(function () {
                $("#divAddNewUniversity" ).hide();
                $("#divShowUniversity").show();
            });

            $("#tmpId").val(data[0].id);
            $("#varsityName").val(data[0].varsityName);
            $("#varsityNickname").val(data[0].varsityNickname);
            $("#varsityCampus").val(data[0].campus);
            $("#universityTypeCombo").val(data[0].fkUniversityType);

        }// edit button work in tha table end
        function tempDiv(){
            $("#successMessage").fadeTo(2000, 500).slideUp(500, function(){
                $("#successMessage").slideUp(500);
            });
            $("#errorMessage").fadeTo(2000, 500).slideDown(500, function(){
                $("#errorMessage").slideDown(500);
            });
        }

    }); // End Ready function

</script>

<div class="col-md-12" id="divAddNewUniversity">
<main class="content">

        <!-------------------------------------------------->
        <div class="clearfix">

                <button id="btnShowUniversity" class="btn btn-primary" style="float: right; margin-right: 0%;margin-bottom: 3%;"><i data-feather="eye"></i>&nbsp;View University</button>

            <h1 class="h3 mb-3">University Form</h1>
        </div>
        <!-------------------------------------------------->
    <div class="container-fluid p-0">
        <div class="row">
            <div id="create-new-university" class="col-12"><!--  col-md-6 -->
                <div class="card">
                    <div class="card-header">
                        <h5 class="card-title">Create New University Form</h5>
                        <h6 class="card-subtitle text-muted">This table is for all University information</h6>
                    </div>
                    <div class="card-body">
                        <form >
                            <fieldset>

                                <div class="well well-sm" id="successMessage" style="background-color:#1D9B2A; color:#fff;"></div>
                                <div class="well well-sm" id="errorMessage" style="background-color:red; color:#fff;"></div>

                                <input class="d-none" type="text" id="tmpId" name="tmpId" value="0" readonly="readonly">
                                <!-- class="hidden" -->

                                <div class="form-row">
                                    <div class="form-group col-md-9">
                                        <label for="varsityName">University Name :</label>
                                        <input id="varsityName" name="varsityName" placeholder="Enter Univarsity Name" class="form-control input-md" type="text">
                                    </div>

                                    <div class="form-group col-md-3">
                                        <label for="varsityNickname">Univarsity's Abbreviation :</label>
                                        <input id="varsityNickname" name="varsityNickname" placeholder="Enter Varsity's Abbreviation" class="form-control input-md" type="text">
                                    </div>

                                    <div class="form-group col-md-3">
                                        <label for="divUniversityType">University's Type :</label>
                                        <div id="divUniversityType"></div>

                                    </div>

                                    <div class="form-group col-md-9">
                                        <label for="varsityCampus">Address Of Univarsity Campus :</label>
                                        <input id="varsityCampus" name="varsityCampus" placeholder="Enter Varsity's Address" class="form-control input-md" type="text">
                                    </div>

                                </div>


                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="btnSaveUniVarsity"></label>
                                    <div class="col-md-7">
                                        <button id="btnSaveUniVarsity" name="btnSaveUniVarsity" class="btn btn-primary">Save</button>
                                        <button id="btnResetUniVarsity" name="btnResetUniVarsity" class="btn btn-warning" type="reset" value="reset">Reset</button>
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
<div class="col-md-12" id="divShowUniversity">
<main class="content">
    <!-------------------------------------------------->
    <div class="clearfix">

        <button id="btnAddNewUniversity" class="btn btn-primary" style="float: right; margin-right: 0%;margin-bottom: 3%;"><i data-feather="plus"></i>&nbsp;Add University</button>

        <h1 class="h3 mb-3">University Information</h1>
    </div>
    <!-------------------------------------------------->
    <div class="container-fluid p-0">
    <div class="row">
        <div id="existing-university" class="col-12">
            <div class="card">
                <div class="card-header">
                    <h5 class="card-title">Existing University Information</h5>
                    <h6 class="card-subtitle text-muted">This table is for all university information</h6>
                </div>
                <div class="card-body">
                    <div id="divUniversity"></div>
                </div>
            </div>
        </div>
    </div>
    </div>
</main>
</div>