<script type="text/javascript">

    var populateDataForUpdate;

    /*start ready function*/
    $(document).ready(function () {
        $("#successMessage").addClass("d-none");
        $("#errorMessage").addClass("d-none");

        var departmentTypeInformation = [];

        funViewDepartmentTypeData();
        $("#tmpId").val(0);

        $("#divAddDepartmentType" ).show();
        $("#divShowDepartmentType").hide();

        // validation checking start
        function validator() {
            var departmentName = $.trim($("#departmentName").val());
            var departmentNickname = $.trim($("#departmentNickname").val());
            var facultyName = $.trim($("#facultyName").val());
            var facultyNickname = $.trim($("#facultyNickname").val);

            if (departmentName == ""){
                $("#errorMessage").html("Please enter a valid department name !!");
                $("#errorMessage").removeClass("d-none");
                $("#successMessage").addClass("d-none");
                return false;
            }
            else if (departmentNickname == ""){
                $("#errorMessage").html("Please enter a valid department abbreviation name !!");
                $("#errorMessage").removeClass("d-none");
                $("#successMessage").addClass("d-none");
                return false;
            }
            else if (facultyName == ""){
                $("#errorMessage").html("Please enter a valid faculty name !!");
                $("#errorMessage").removeClass("d-none");
                $("#successMessage").addClass("d-none");
                return false;
            }
            else if (facultyNickname == ""){
                $("#errorMessage").html("Please enter a valid faculty abbreviation name !!");
                $("#errorMessage").removeClass("d-none");
                $("#successMessage").addClass("d-none");
                return false;
            }
            return true;

        } // validation checking end

        // submitting form to controller
        $("#btnSaveDepartmentType").click(function (event) {
            alert("click")

            $("#divAddDepartmentType" ).hide();
            $("#divShowDepartmentType").show();

            event.preventDefault();

            if (validator()){
                var departmentType = {};

                departmentType ["tmpId"] = $.trim($("#tmpId").val());
                departmentType ["departmentName"] = $.trim($("#departmentName").val());
                departmentType ["departmentNickname"] = $.trim($("#departmentNickname").val());
                departmentType ["facultyName"] = $.trim($("#facultyName").val());
                departmentType ["facultyNickname"] = $.trim($("#facultyNickname").val());

                alert(JSON.stringify(departmentType));

                $.ajax({
                    type : "POST",
                    url : "save-department-type",
                    data : JSON.stringify(departmentType),
                    contentType : "application/json; charset utf-8",
                    success : function (successData) {
                        $("#successMessage").html(successData);
                        $("#successMessage").removeClass("d-none");
                        $("#errorMessage").addClass("d-none");

                        funViewDepartmentTypeData();
                        $("#tmpId").val(0);
                        tempDiv();
                    },
                    error: function (error) {
                        $("#errorMessage").html("Error: Record Not Saved");
                        $("#errorMessage").removeClass("d-none");
                        $("#successMessage").addClass("d-none");
                        //alert(JSON.stringify(error));
                        tempDiv();
                    }
                });
            }

        }); // end of form submission

        // function for viewing existing data
        function funViewDepartmentTypeData() {
            $.post("view-all-department-type",function (data) {
                var departmentTypeData = '<table id="tblDepartmentType" class="table table-striped">' + '<thead style="background-color: #0097A7;color: #fff;font-style: italic;text-align: center;"><tr><th>ID</th>><th>Department Name</th><th>Department Abbreviation</th><th>Faculty Name</th><th>Faculty Abbreviation</th><th>Action</th><th>Action</th></tr></thead><tbody style="background-color: #ffe6e6;text-align:center;font-style: normal;">';
                for (var key in data){
                    var departmentTypeObject = {"id":[],"departmentName":[],"departmentNickname":[],"facultyName":[],"facultyNickname":[]};

                    departmentTypeObject["id"] = data[key].id;
                    departmentTypeObject["departmentName"] = data[key].departmentName;
                    departmentTypeObject["departmentNickname"] = data[key].departmentNickname;
                    departmentTypeObject["facultyName"] = data[key].facultyName;
                    departmentTypeObject["facultyNickname"] = data[key].facultyNickname;

                    departmentTypeInformation.push(departmentTypeObject);

                    departmentTypeData += '<tr><td>' + data[key].id + '</td><td>' + data[key].departmentName + '</td><td>' + data[key].departmentNickname + '</td><td>' + data[key].facultyName + '</td><td>' + data[key].facultyNickname + '</td><td><a href="#" id="updateBillingg" class="btn btn-sm btn-danger"><span class="far fa-fw fa-trash"></span> Delete</a></td><td> <a class="btn btn-sm btn-success" id="btnUpdate_' + data[key].id + '" onclick="populateDataForUpdate(' + data[key].id + ')"><span class="far fa-fw fa-edit"></span> Edit</a></td></tr>';
                }
                departmentTypeData += '</tbody></table>';

                $("#divDepartmentType").html(departmentTypeData);
                $("#tblDepartmentType").DataTable();

                /*// start update data
                $('#tblDepartmentType tbody').on('dblclick', 'tr', function () {

                    var tableData = $(this).children("td").map(function() {
                        return $(this).html();
                    }).get();

                    $("#btnSaveDepartmentType").html("Update");
                    $("#btnResetDepartmentType").removeClass("d-none");

                    $("#tmpId").val(tableData[0]);
                    $("#departmentName").val(tableData[1]);
                    $("#departmentNickname").val(tableData[2]);

                }); // end update data*/
            });
        } // end of function for viewing existing data


        $( "#btnAddNewDepartmentType" ).click(function() {

            $("#divShowDepartmentType").hide();
            $("#errorMessage").addClass("d-none");
            $("#divAddDepartmentType" ).show();
        });

        $( "#btnShowNewDepartmentType" ).click(function() {

            $("#divAddDepartmentType").hide();
            $("#errorMessage").addClass("d-none");
            $("#divShowDepartmentType").show();
        });

        // edit button work in tha table start
        populateDataForUpdate = function(DepartmentTypeId){

            $("#divAddDepartmentType" ).show();
            $("#divShowDepartmentType").hide();

            var data = departmentTypeInformation.filter(obj => {
                return obj.id === DepartmentTypeId
            });

            $("#btnSaveDepartmentType").html("Update");

            $("#btnSaveDepartmentType").click(function () {
                $("#divAddDepartmentType" ).hide();
                $("#divShowDepartmentType").show();
            });

            $("#tmpId").val(data[0].id);
            $("#departmentName").val(data[0].departmentName);
            $("#departmentNickname").val(data[0].departmentNickname);
            $("#facultyName").val(data[0].facultyName);
            $("#facultyNickname").val(data[0].facultyNickname);

        }// edit button work in tha table end
        function tempDiv(){
            $("#successMessage").fadeTo(2000, 500).slideUp(500, function(){
                $("#successMessage").slideUp(500);
            });
            $("#errorMessage").fadeTo(2000, 500).slideDown(500, function(){
                $("#errorMessage").slideDown(500);
            });
        }

    }); /*end ready function*/

    function funDeleteDepartmentName(){
        var r = confirm("Are you sure you want to delete this?");
        if (r == true) {

            $.post("delete-department-info", {id: $("#tmpId").val()}, function(data){
                $("#successMessage").html(data);
                //funViewPrivateVarsityData();

            });
        } else {
            return false;
        }
    }

</script>

<div class="col-md-12" id="divAddDepartmentType">
    <main class="content">

        <!-------------------------------------------------->
        <div class="clearfix">

            <button id="btnShowNewDepartmentType" class="btn btn-primary" style="float: right; margin-right: 0%;margin-bottom: 3%;"><i data-feather="eye"></i>&nbsp;View Department Type</button>

            <h1 class="h3 mb-3">Department Type</h1>
        </div>
        <!-------------------------------------------------->
        <div class="container-fluid p-0">
            <div class="row">
                <div id="create-new-departmentType" class="col-12"><!--  col-md-6 -->
                    <div class="card">
                        <div class="card-header">
                            <h5 class="card-title">Create New Department Type</h5>
                            <h6 class="card-subtitle text-muted">This table is for all department type information</h6>
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
                                            <label for="departmentName">Department Name :</label>
                                            <input id="departmentName" name="departmentName" placeholder="Enter Department Name" class="form-control input-md" type="text">
                                        </div>
                                        <div class="form-group col-md-4">
                                            <label for="departmentNickname">Department Abbreviation :</label>
                                            <input id="departmentNickname" name="departmentNickname" placeholder="Department Abbreviation" class="form-control input-md" type="text">
                                        </div>
                                        <div class="form-group col-md-8">
                                            <label for="facultyName">Faculty Name :</label>
                                            <input id="facultyName" name="facultyName" placeholder="Enter Faculty Name" class="form-control input-md" type="text">
                                        </div>
                                        <div class="form-group col-md-4">
                                            <label for="facultyNickname">Faculty Abbreviation :</label>
                                            <input id="facultyNickname" name="facultyNickname" placeholder="Faculty Abbreviation" class="form-control input-md" type="text">
                                        </div>

                                    </div>

                                    <div class="form-group">
                                        <label class="col-md-4 control-label" for="btnSaveDepartmentType"></label>
                                        <div class="col-md-7">
                                            <input type="button" id="btnDelete" name="btnDelete" class="btn btn-danger hidden"  onclick="funDeleteDepartmentName()" value="Delete">
                                            <button id="btnSaveDepartmentType" name="btnSaveUniversityType" class="btn btn-primary">Save</button>
                                            <button id="btnResetDepartmentType" name="btnResetDepartmentType" class="btn btn-warning" type="reset" value="reset">Reset</button>
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

<div class="col-md-12" id="divShowDepartmentType">
    <main class="content">
        <!-------------------------------------------------->
        <div class="clearfix">

            <button id="btnAddNewDepartmentType" class="btn btn-primary" style="float: right; margin-right: 0%;margin-bottom: 3%;"><i data-feather="plus"></i>&nbsp;Add Department Type</button>

            <h1 class="h3 mb-3">Department Type Information</h1>
        </div>
        <!-------------------------------------------------->
        <div class="container-fluid p-0">
            <div class="row">
                <div id="existing-departmentType" class="col-12">
                    <div class="card">
                        <div class="card-header">
                            <h5 class="card-title">Existing Department Type</h5>
                            <h6 class="card-subtitle text-muted">This table is for all department type information</h6>
                        </div>
                        <div class="card-body">
                            <div id="divDepartmentType"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
</div>