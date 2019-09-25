
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
        $.post("view-all-university", function (data) {
            allUniversityName = data;
        })
    } // id to name mapping end

    // start ready function
    $(document).ready(function () {
        funViewEngVarsityData();
        // function for viewing existing data
        function funViewEngVarsityData() {
            $.post("get-all-engineering-university-achievement",function (data) {
                var priVarsityResearchData = '<table id="tblPrivateResearch" class="table table-striped">' + '<thead style="background-color: #0097A7;color: #fff;font-style: italic;text-align: center;"><tr> <th>Achievement Title</th><th>University Type</th><th>University Name</th><th>Competition Position</th><th>Competition Title</th><th>Competition Place</th><th>Competition Date(YY-MM-DD)</th></tr></thead><tbody style="background-color: #ffe6e6;text-align:center;font-style: normal;">';
                for (var key in data){
                    // id to name mapping start
                    var tmpUniversityName = allUniversityName.filter(obj =>{
                        return obj.id === data[key].fkVarsityName
                    }); // id to name mapping end

                    // id to name mapping start
                    var tmpUniversityType = allUniversityType.filter(obj =>{
                        return obj.id === data[key].fkVarsityType

                    }); // id to name mapping end

                    priVarsityResearchData +=  '<tr><td>' + data[key].achievementTitle + '</td><td>' + tmpUniversityType[0].uniVersityType + '</td><td>' + tmpUniversityName[0].varsityName +'</td><td>'+data[key].competitionPosition+'</td><td>'+data[key].competitionTitle+'</td><td>'+data[key].competitionPlace+'</td><td>'+data[key].competitionDate+'</td></tr>';
                }
                priVarsityResearchData += '</tbody></table>';
                $("#divEngineeringVarsityAchievement").html(priVarsityResearchData);
                $("#tblPrivateResearch").DataTable();

            });
        } // end of function for viewing existing data

    }); // end of ready function
</script>



<main class="content">
        <div class="container-fluid p-0">
            <div class="row">
                <div id="existing-engineering-varsity-achievement" class="col-12">
                    <div class="card">
                        <div class="card-header">
                            <h5 class="card-title">Existing Engineering University Achievement</h5>
                            <h6 class="card-subtitle text-muted">This table is for all engineering university achievement information</h6>
                        </div>
                        <div class="card-body">
                            <div id="divEngineeringVarsityAchievement"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</main>
