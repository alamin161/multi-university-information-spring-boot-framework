<script type="text/javascript">

    // id to name mapping start
    var allUniversityType = [];
    getAllUniversityType();
    function getAllUniversityType(){
        $.post("view-all-university-type",function (data) {
            allUniversityType = data;
        });
    } // id to name mapping end
    // start ready function
    $(document).ready(function () {
        funViewEngVarsityData();
        // function for viewing existing data
        function funViewEngVarsityData() {
            $.post(" get-all-engineering-university",function (data) {
                var engVarsityData = '<table id="tblEngVarsity" class="table table-striped">' + '<thead style="background-color: #0097A7;color: #fff;font-style: italic;text-align: center;"><tr> <th>University Name</th><th>University Abbreviation</th><th>Campus</th><th>University Type</th></tr></thead><tbody style="background-color: #ffe6e6;text-align:center;font-style: normal;">';
                for (var key in data){
                    // id to name mapping start
                    var tmpUniversityType = allUniversityType.filter(obj =>{
                        return obj.id === data[key].fkUniversityType

                    }); // id to name mapping end

                    engVarsityData +=   '<tr><td>' + data[key].varsityName + '</td><td>' + data[key].varsityNickname + '</td><td>' + data[key].campus +'</td><td>'+tmpUniversityType[0].uniVersityType+ '</td></tr>';
                }
                engVarsityData += '</tbody></table>';
                $("#divEngineeringUniversity").html(engVarsityData);
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
                    <h5 class="card-title">Existing Engineering University</h5>
                    <h6 class="card-subtitle text-muted">This table is for all engineering university information</h6>
                </div>
                <div class="card-body">
                    <div id="divEngineeringUniversity"></div>
                </div>
            </div>
        </div>
    </div>
</main>