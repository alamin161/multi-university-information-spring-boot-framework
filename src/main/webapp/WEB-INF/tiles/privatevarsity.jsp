<script type="text/javascript">

    // id to name mapping start
    var allUniversityType = [];
    getAllUniversityType();
    function getAllUniversityType(){
        $.post("view-all-university-type",function (data) {
            allUniversityType = data;
        });
    } // id to name mapping end

    $(document).ready(function () {
        funViewPublicVarsity();

        /*Function for viewing existing data in grid*/
        function funViewPublicVarsity() {
            $.post("get-all-private-university",function (data) {
                var publicVarsityData = '<table id="tblPublicVarsity" class="table table-striped">'+ '<thead style="background-color: #0097A7;color: #fff;font-style: italic;text-align: center;"><tr> <th>University Name</th><th>University Abbreviation</th><th>University Campus</th><th>University Type</th> </tr></thead><tbody style="background-color: #ffe6e6;text-align:center;font-style: normal;">';

                for (var key in data){

                    // id to name mapping start
                    var tmpUniversityType = allUniversityType.filter(obj =>{
                        return obj.id === data[key].fkUniversityType

                    }); // id to name mapping end

                    publicVarsityData +=   '<tr><td>'+ data[key].varsityName + '</td><td >'+data[key].varsityNickname + '</td><td>'+data[key].campus +'</td><td>'+tmpUniversityType[0].uniVersityType+'</td></tr>';

                }
                publicVarsityData +='</tbody></table>';

                $("#divPrivateUniversity").html(publicVarsityData);
                $("#tblPublicVarsity").DataTable();
            });
        }  /*end here for viewing existing data*/
    });//end of document ready function
</script>

<main class="content">
    <!-------------------------------------------------->
    <div class="clearfix">

            <button id="btnAddNewPrivateVarsity" class="btn btn-primary" style="float: right; margin-right: 0%;margin-bottom: 3%;">
                <i data-feather="plus"></i>&nbsp;Add University</button>

        <h1 class="h3 mb-3">Private University</h1>
    </div>
    <!-------------------------------------------------->
    <div class="container-fluid p-0">
        <div class="row">
        <div id="existing-privateUniversity" class="col-12">
            <div class="card">
                <div class="card-header">
                    <h5 class="card-title">Existing Private University</h5>
                    <h6 class="card-subtitle text-muted">This table is for all private university information</h6>
                </div>
                <div class="card-body">
                    <div id="divPrivateUniversity"></div>
                </div>
            </div>
        </div>
        </div>
        </div>
</main>
