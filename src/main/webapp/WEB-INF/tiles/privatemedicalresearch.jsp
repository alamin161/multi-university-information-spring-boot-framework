

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
    var allUniversityDepartmentAbbreviation = [];
    getAllUniversityDepartmentAbbreviation();
    function getAllUniversityDepartmentAbbreviation(){
        $.post("view-all-department-type", function (data) {
            allUniversityDepartmentAbbreviation = data;
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
        funViewEngVarsityData();
        // function for viewing existing data
        function funViewEngVarsityData() {
            $.post("get-all-private-medical-college-research",function (data) {
                var priVarsityResearchData = '<table id="tblPrivateResearch" class="table table-striped">' + '<thead style="background-color: #0097A7;color: #fff;font-style: italic;text-align: center;"><tr> <th>Research Name</th><th>University Type</th><th>University Name</th><th>Teacher Name</th><th>Department Abbreviation</th><th>Research Published(YY-MM-DD)</th></tr></thead><tbody style="background-color: #ffe6e6;text-align:center;font-style: normal;">';
                for (var key in data){
                    // id to name mapping start
                    var tmpUniversityName = allUniversityName.filter(obj =>{
                        return obj.id === data[key].fkVarsityName
                    }); // id to name mapping end

                    // id to name mapping start
                    var tmpUniversityType = allUniversityType.filter(obj =>{
                        return obj.id === data[key].fkVarsityType

                    }); // id to name mapping end

                    // id to name mapping start
                    var tmpUniversityDepartmentAbbreviation = allUniversityDepartmentAbbreviation.filter(obj =>{
                        return obj.id === data[key].fkDepartmentNickname
                    }); // id to name mapping end

                    priVarsityResearchData +=  '<tr><td>' + data[key].researchName + '</td><td>' + tmpUniversityType[0].uniVersityType + '</td><td>' + tmpUniversityName[0].varsityName +'</td><td>'+data[key].teacherName+'</td><td>'+tmpUniversityDepartmentAbbreviation[0].departmentNickname+'</td><td>'+data[key].researchPublished+'</td></tr>';
                }
                priVarsityResearchData += '</tbody></table>';
                $("#divPrivateMedicalResearch").html(priVarsityResearchData);
                $("#tblPrivateResearch").DataTable();

            });
        } // end of function for viewing existing data

    }); // end of ready function
</script>


<main class="content">
    <div class="container-fluid p-0">
        <div class="row">
        <div id="existing-engineeringUniversity" class="col-12">
            <div class="card">
                <div class="card-header">
                    <h5 class="card-title">Private Medical College Research</h5>
                    <h6 class="card-subtitle text-muted">This table is for all private medical college research information</h6>
                </div>
                <div class="card-body">
                    <div id="divPrivateMedicalResearch"></div>
                </div>
            </div>
        </div>
        </div>
    </div>
</main>
