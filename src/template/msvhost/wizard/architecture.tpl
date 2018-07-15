<div class="row">
    <div class="col-sm-12">
        <h4 class="info-text"> Choose website architecture </h4>
    </div>

    <div class="col-sm-10 col-sm-offset-1">

        <table class="table table-highlight" id="table_warch">
            <tr>
                <td width="40%"class="table-title">Instance Type</td>
                <td width="30%" style="background:#f3bb45;" onclick="table_architecture(1);">
                    <p style="font-size:21px;" id="title_warch1">Production</p>
                </td>
                <td width="30%" style="background:#f3bb45;" onclick="table_architecture(2);">
                    <p style="font-size:21px;" id="title_warch2">Development</p>
                </td>
            </tr>
            <tr>
                <td class="table-title">Sitograph CMS</td>
                <td class="text-center" onclick="table_architecture(1);">
                    <p>Normal license</p>
                    <span class="label label-success">admin</span> access level
                </td>
                <td class="text-center" onclick="table_architecture(2);">
                    <p>Development license</p>
                    <span class="label label-success">dev</span> access level
                </td>
            </tr>
            <tr>
                <td class="table-title">Subdomain .msvhost.com</td>
                <td class="text-center" onclick="table_architecture(1);"><span class="glyphicon glyphicon-ok"></span></td>
                <td class="text-center" onclick="table_architecture(2);"><span class="glyphicon glyphicon-ok"></span></td>
            </tr>
            <tr>
                <td class="table-title">LAMP server</td>
                <td class="text-center" onclick="table_architecture(1);"><span class="glyphicon glyphicon-ok"></span></td>
                <td class="text-center" onclick="table_architecture(2);"><span class="glyphicon glyphicon-ok"></span></td>
            </tr>
            <tr>
                <td class="table-title">
                    <span>Content delivery optimization</span> <span class="glyphicon glyphicon-info-sign" rel="tooltip" title="PageSpeed Module for Apache is used to optimize delivery"></span>
                </td>
                <td class="text-center" onclick="table_architecture(1);"><span class="glyphicon glyphicon-ok"></span></td>
                <td class="text-center" onclick="table_architecture(2);"><span class="glyphicon glyphicon-remove"></span></td>
            </tr>
            <tr>
                <td class="table-title">Google Analytics integration</td>
                <td class="text-center" onclick="table_architecture(1);"><span class="glyphicon glyphicon-ok"></span></td>
                <td class="text-center" onclick="table_architecture(2);"><span class="glyphicon glyphicon-remove"></span></td>
            </tr>
            <tr>
                <td class="table-title">Google Auth integration</td>
                <td class="text-center" onclick="table_architecture(1);"><span class="glyphicon glyphicon-ok"></span></td>
                <td class="text-center" onclick="table_architecture(2);"><span class="glyphicon glyphicon-remove"></span></td>
            </tr>
            <tr>
                <td class="table-title">FTP service</td>
                <td class="text-center" onclick="table_architecture(1);"><span class="glyphicon glyphicon-remove"></span></td>
                <td class="text-center" onclick="table_architecture(2);"><span class="glyphicon glyphicon-ok"></span></td>
            </tr>
            <tr>
                <td class="table-title">phpMyAdmin</td>
                <td class="text-center" onclick="table_architecture(1);"><span class="glyphicon glyphicon-remove"></span></td>
                <td class="text-center" onclick="table_architecture(2);"><span class="glyphicon glyphicon-ok"></span></td>
            </tr>
            <tr>
                <td class="table-title">Price</td>
                <td class="text-center" onclick="table_architecture(1);">
                    <p style="font-size:16px;">FREE</p>
                </td>
                <td class="text-center" onclick="table_architecture(2);">
                    <p style="font-size:16px;text-decoration: line-through;">249$ per month</p>
                    <p style="font-size:16px;color:red;">2.49$ per month *</p>
                </td>
            </tr>
            <tr class="text-center">
                <td></td>
                <td onclick="table_architecture(1);"><input type="radio" name="architecture" value="warch1" id="warch1"></td>
                <td onclick="table_architecture(2);"><input type="radio" name="architecture" value="warch2" id="warch2"></td>
            </tr>
        </table>

        <p><span style="color:red;">*</span> until 01.01.2019</p>
    </div>
</div>