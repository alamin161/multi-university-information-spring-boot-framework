<script type="text/javascript">

    var populateDataForUpdate;

    //funDeleteUniversityType();
    /*start ready function*/
    $(document).ready(function () {

        $("#successMessage").addClass("d-none");
        $("#errorMessage").addClass("d-none");

        $("#divAddUniversityType" ).hide();
        //$("#divShowUniversityType").hide();

        var universityTypeInformationCommon = [];
        funViewUniversityTypeData();
        $("#tmpId").val(0);

        // validation checking start
        function validator() {

            var universityType = $.trim($("#universityType").val());

            if (universityType == ""){
                $("#errorMessage").html("Please enter a valid varsity type !!");
                $("#errorMessage").removeClass("d-none");
                $("#successMessage").addClass("d-none");

                //alert("university type can not be null");

                return false;
            }
            return true;

        } // validation checking end

        // submitting form to controller
        $("#btnSaveUniversityType").click(function (event) {
            alert("click")
            event.preventDefault();

            $("#divAddUniversityType" ).hide();
            $("#divShowUniversityType").show();

            if (validator()){
                var universityType = {};

                universityType ["tmpId"] = $.trim($("#tmpId").val());
                universityType ["uniVersityType"] = $.trim($("#universityType").val());

                alert(JSON.stringify(universityType));

                $.ajax({
                    type : "POST",
                    url : "save-university-type",
                    data : JSON.stringify(universityType),
                    contentType : "application/json; charset utf-8",
                    success : function (successData) {
                        $("#successMessage").html(successData);
                        $("#successMessage").removeClass("d-none");
                        $("#errorMessage").addClass("d-none");

                        funViewUniversityTypeData();
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

        // function for viewing existing data  table table-bordered table-hover
        function funViewUniversityTypeData() {
            $.post("view-all-university-type",function (data) {
                var varsityTypeData = '<table id="tblVarsityType" class="table table-striped">' + '<thead style="background-color: #0097A7;color: #fff;font-style: italic;text-align: center;"><tr><th>ID</th><th>University Type</th><th>Action</th></tr></thead><tbody style="background-color: #ffe6e6;text-align:center;font-style: normal;">';
                for (var key in data){

                    var universityTypeObject = {"id":[],"uniVersityType":[]};

                    universityTypeObject["id"] = data[key].id;
                    universityTypeObject["uniVersityType"] = data[key].uniVersityType;

                    universityTypeInformationCommon.push(universityTypeObject);

                    varsityTypeData += '<tr><td>' + data[key].id + '</td><td>' + data[key].uniVersityType +  '</td><td><a class="btn btn-sm btn-success" id="btnUpdate_' + data[key].id + '" onclick="populateDataForUpdate(' + data[key].id + ')"><span class="far fa-fw fa-edit"></span> Edit</a></td></tr>';
                }
                varsityTypeData += '</tbody></table>';

                $("#divUniversityType").html(varsityTypeData);
                $("#tblVarsityType").DataTable();
            });
        } // end of function for viewing existing data


        $( "#btnAddNewUniversityType" ).click(function() {

            $("#divShowUniversityType").hide();
            $("#errorMessage").addClass("d-none");
            $("#divAddUniversityType" ).show();

        });

        $( "#btnShowNewUniversityType" ).click(function() {

            $("#divAddUniversityType").hide();
            $("#errorMessage").addClass("d-none");
            $("#divShowUniversityType").show();

        });

        // Start Table edit button work here for update
        populateDataForUpdate = function(universityTypeId){

            $("#divAddUniversityType" ).show();
            $("#divShowUniversityType").hide();

            var data = universityTypeInformationCommon.filter(obj => {
                return obj.id === universityTypeId
            });

            $("#btnSaveUniversityType").html("Update");

            $("#btnSaveUniversityType").click(function () {
                $("#divAddUniversityType" ).hide();
                $("#divShowUniversityType").show();
            });

            $("#tmpId").val(data[0].id);
            $("#universityType").val(data[0].uniVersityType);

        } // End Table edit button work here for update
        function tempDiv(){
            $("#successMessage").fadeTo(2000, 500).slideUp(500, function(){
                $("#successMessage").slideUp(500);
            });
            $("#errorMessage").fadeTo(2000, 500).slideUp(500, function(){
                $("#errorMessage").slideUp(500);
            });
        }

    }); /*end ready function*/

</script>

<div class="col-md-12" id="divAddUniversityType">
<main class="content">

        <!-------------------------------------------------->
        <div class="clearfix">

                <button id="btnShowNewUniversityType" class="btn btn-primary" style="float: right; margin-right: 0%;margin-bottom: 3%;"><i data-feather="eye"></i>&nbsp;View University Type</button>

            <h1 class="h3 mb-3">University Type</h1>
        </div>
        <!-------------------------------------------------->
    <div class="container-fluid p-0">
        <div class="row">
            <div id="create-new-universityType" class="col-12"><!--  col-md-6 -->
                <div class="card">
                    <div class="card-header"  >
                        <h5 class="card-title"  >Create New University Type</h5>
                        <h6 class="card-subtitle text-muted">This table is for all university type information</h6>
                    </div>
                    <div class="card-body">
                        <form >
                            <fieldset>

                                <div class="well well-sm" id="successMessage" style="background-color:#1D9B2A; color:#fff;"></div>
                                <div class="well well-sm" id="errorMessage" style="background-color:red; color:#fff;"></div>

                                <input class="d-none" type="text" id="tmpId" name="tmpId" value="0" readonly="readonly">
                                <!-- class="hidden" -->

                                <div class="form-row">
                                    <div class="form-group col-md-8">
                                        <label for="universityType">University Type</label>
                                        <input id="universityType" name="universityType" placeholder="Enter Univarsity Type" class="form-control input-md" type="text">
                                    </div>

                                </div>

                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="btnSaveUniversityType"></label>
                                    <div class="col-md-7">
                                        <%--<input type="button" id="btnDelete" name="btnDelete" class="btn btn-danger hidden"  onclick="funDeleteUniversityType()" value="Delete">--%>
                                        <button id="btnSaveUniversityType" name="btnSaveUniversityType" class="btn btn-primary">Save</button>
                                        <button id="btnResetUniversityType" name="btnResetUniversityType" class="btn btn-warning" type="reset" value="reset">Reset</button>
                                    </div>
                                </div>
                    </fieldset>
                    </form>
                    </div>
                </div>
            </div>
            </div>
        </div><!-- //// -->
</main>
</div>

<div class="col-md-12" id="divShowUniversityType">
<main class="content">
    <!-------------------------------------------------->
    <div class="clearfix">

        <button id="btnAddNewUniversityType" class="btn btn-primary" style="float: right; margin-right: 0%;margin-bottom: 3%;"><i data-feather="plus"></i>&nbsp;Add University Type</button>

        <h1 class="h3 mb-3">Teacher Information</h1>
    </div>
    <!-------------------------------------------------->
    <div class="container-fluid p-0">
        <div class="row">
        <div id="existing-universityType" class="col-12">
            <div class="card">
                <div class="card-header">
                    <h5 class="card-title">Existing University Type</h5>
                    <h6 class="card-subtitle text-muted">This table is for all university type information</h6>
                </div>
                <div class="card-body">
                    <div id="divUniversityType"></div>
                </div>
            </div>
        </div>
        </div>
    </div>
</main>
</div>