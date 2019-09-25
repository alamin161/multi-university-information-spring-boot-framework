<script type="text/javascript">

    // start ready function
    $(document).ready(function () {
        funViewEngVarsityData();
        // function for viewing existing data
        function funViewEngVarsityData() {
            $.post("get-all-public-university-teacher",function (data) {
                var engVarsityData = '<table id="tblEngVarsity" class="table table-striped">' + '<thead style="background-color: #0097A7;color: #fff;font-style: italic;text-align: center;"><tr> <th>Teacher Name</th><th>Teacher E-mail</th><th>Skill</th><th>Graduation</th><th>Action</th></tr></thead><tbody style="background-color: #ffe6e6;text-align:center;font-style: normal;">';
                for (var key in data){
                    engVarsityData +=   '<tr><td>' + data[key].name + '</td><td>' + data[key].email + '</td><td>' + data[key].skill +'</td><td>'+data[key].graduation+ '</td><td> <a class=" btn btn-sm btn-success" id="btnUpdate_' + data[key].id + '" onclick="populateDataForUpdate(' + data[key].id + ')"><span class="far fa-fw fa-eye"></span> View</a></td></tr>';
                }
                engVarsityData += '</tbody></table>';
                $("#divPublicUniversityTeacher").html(engVarsityData);
                $("#tblEngVarsity").DataTable();

            });
        } // end of function for viewing existing data

    }); // end of ready function


</script>


<main class="content">
    <div class="container-fluid p-0">

        <div id="existing-engineeringUniversity" class="col-12">
            <div class="card">
                <div class="card-header">
                    <h5 class="card-title"> Public University Teacher</h5>
                    <h6 class="card-subtitle text-muted">This table is for all public university teacher information</h6>
                </div>
                <div class="card-body">
                    <div id="divPublicUniversityTeacher"></div>
                </div>
            </div>
        </div>
    </div>
</main>