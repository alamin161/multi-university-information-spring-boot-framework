<script type="text/javascript">

    var populateDataForUpdate;
    // start ready function
    $(document).ready(function () {
        $("#successMessage").addClass("d-none");
        $("#errorMessage").addClass("d-none");

        var universityTypeInformationCommon = [];
        funViewFormTestData();
        $("#tmpId").val(0);
        // validation checking start
        function validator() {

            var formTest = $.trim($("#formTest").val());

            if (formTest == ""){
                $("#errorMessage").html("Please enter a valid text !!");
                $("#errorMessage").removeClass("d-none");
                $("#successMessage").addClass("d-none");
            }
            return true;

        } // validation checking end
        // submitting form to controller
        $("#btnSaveForm").click(function (event) {
            alert("click")
            event.preventDefault();

            if (validator()){
                var formText = {};

                //formText ["tmpId"] = $.trim($("#tmpId").val());
                formText ["field"] = $.trim($("#formTest").val());

                alert(JSON.stringify(formText));

                $.ajax({
                    type : "POST",
                    url : "save-form-test",
                    data : JSON.stringify(formText),
                    contentType : "application/json; charset utf-8",
                    success : function (successData) {
                        $("#successMessage").html(successData);
                        $("#successMessage").removeClass("d-none");
                        $("#errorMessage").addClass("d-none");

                        funViewFormTestData();
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
        function funViewFormTestData() {
            $.post("view-all-form-test",function (data) {
                var varsityTypeData = '<table id="tblVarsityType" class="table table-bordered table-hover">' + '<thead><tr><th>ID</th><th>Text Here</th><th>Action</th><th>Action</th></tr></thead><tbody>';
                for (var key in data){

                    var universityTypeObject = {"id":[],"field":[]};

                    universityTypeObject["id"] = data[key].id;
                    universityTypeObject["field"] = data[key].field;

                    universityTypeInformationCommon.push(universityTypeObject);

                    varsityTypeData += '<tr><td>' + data[key].id + '</td><td>' + data[key].field +  '</td><td><a href="#" id="updateBillingg" class="btn btn-sm btn-danger"><span class="far fa-fw fa-trash"></span> Delete</a></td><td><a class="btn btn-sm btn-warning" id="btnUpdate_' + data[key].id + '" onclick="populateDataForUpdate(' + data[key].id + ')"><span class="far fa-fw fa-edit"></span> Edit</a></td></tr>';
                }
                varsityTypeData += '</tbody></table>';

                $("#divUniversityType").html(varsityTypeData);
                $("#tblVarsityType").DataTable();

                /*// start update data
                $('#tblVarsityType tbody').on('dblclick', 'tr', function () {

                    var tableData = $(this).children("td").map(function() {
                    return $(this).html();
                }).get();

                $("#btnSaveUniversityType").html("Update");
                $("#btnResetUniversityType").removeClass("d-none");

                $("#tmpId").val(tableData[0]);
                $("#universityType").val(tableData[1]);

            }); // end update data*/
            });
        } // end of function for viewing existing data

        // Start Table edit button work here for update
        populateDataForUpdate = function(universityTypeId){

            //$("#divAddUniversityType" ).show();
            //$("#divShowUniversityType").hide();

            var data = universityTypeInformationCommon.filter(obj => {
                return obj.id === universityTypeId
            });

            $("#btnSaveForm").html("Update");

           /* $("#btnSaveUniversityType").click(function () {
                $("#divAddUniversityType" ).hide();
                $("#divShowUniversityType").show();
            });*/

            $("#tmpId").val(data[0].id);
            $("#formTest").val(data[0].field);

        } // End Table edit button work here for update
    });// end ready function
    function funDeleteForm(){
        var r = confirm("Are you sure you want to delete this?");
        if (r == true) {

            $.post("delete-form", {id: $("#tmpId").val()}, function(data){
                $("#successMessage").html(data);
            });
        } else {
            return false;
        }
    } // End Delete Work

</script>



<div class="col-md-12" id="divAddUniversityType">
    <main class="content">

        <!-------------------------------------------------->
        <div class="clearfix">

            <button id="btnShowNewUniversityType" class="btn btn-primary" style="float: right; margin-right: 0%;margin-bottom: 3%;"><i data-feather="eye"></i>&nbsp;View University Type</button>

            <h1 class="h3 mb-3">Form Test</h1>
        </div>
        <!-------------------------------------------------->
        <div class="container-fluid p-0">
            <div class="row">
                <div id="create-new-universityType" class="col-12"><!--  col-md-6 -->
                    <div class="card">
                        <div class="card-header">
                            <h5 class="card-title">Create New University Type</h5>
                            <h6 class="card-subtitle text-muted">This table is for all university type information</h6>
                        </div>
                        <div class="card-body">
                            <form >
                                <fieldset>

                                    <div class="well well-sm" id="successMessage" style="background-color:#1D9B2A; color:#fff;"></div>
                                    <div class="well well-sm" id="errorMessage" style="background-color:red; color:#fff;"></div>
                                        <%--<label class="custom-control custom-radio">
                                            <input type="radio" name="toastr-position" class="custom-control-input" value="toast-top-right" checked>
                                            <span class="custom-control-label">Top Right</span>
                                        </label>--%>

                                    <input class="" type="text" id="tmpId" name="tmpId" value="0" readonly="readonly">
                                    <!-- class="hidden" -->

                                    <div class="form-row">
                                        <div class="form-group col-md-8">
                                            <label for="formTest">Write Something</label>
                                            <input id="formTest" name="formTest" placeholder="Enter Something" class="form-control input-md" type="text">
                                        </div>

                                    </div>

                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="btnSaveForm"></label>
                                        <div class="col-md-7">
                                            <input type="button" id="btnDelete" name="btnDelete" class="btn btn-danger hidden"  onclick="funDeleteForm()" value="Delete">
                                            <button id="btnSaveForm" name="btnSaveForm" class="btn btn-primary">Save</button>
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

            <h1 class="h3 mb-3">Form Test Data</h1>
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