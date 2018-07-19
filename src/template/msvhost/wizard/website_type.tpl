<h4 class="info-text">Choose a type of your new website</h4>
<div class="row">
    <div class="col-sm-12">

        <table class="table table-highlight" id="table_wtype">
            <tr>
                <td width="20%"class="table-title">Website</td>
                <td width="20%" style="background:#f3bb45;" onclick="table_type(1);">
                    <p style="min-height: 55px; font-size:21px;" id="title_wtype1">Sitograph Empty</p>
                    <img src="https://www.sitograph.com/content/gallery_photos/2018/03/5abf7eb47c83a-pic.jpg" class="img-thumbnail">
                </td>
                <td width="20%" style="background:#f3bb45;" onclick="table_type(2);">
                    <p style="min-height: 55px; font-size:21px;" id="title_wtype2">Theme Default</p>
                    <img src="http://rep.msvhost.com/content/articles/2018/07/5b43adb4e2654-pic.jpg" class="img-thumbnail"
                </td>
                <td width="20%" style="background:#f3bb45;;" onclick="table_type(3);">
                    <p style="min-height: 55px; font-size:21px;" id="title_wtype3">Theme Sitograph</p>
                    <img src="http://rep.msvhost.com/content/images/module_preview/theme-sitograph.jpg" class="img-thumbnail"
                </td>
                <td width="20%" style="background:#f3bb45;" onclick="table_type(4);">
                    <p class="text-muted" style="min-height: 55px; font-size:21px;" id="title_wtype4">E-commerce</p>
                    <img src="http://rep.msvhost.com/content/images/module_preview/theme-default.jpg" class="img-thumbnail"
                </td>
            </tr>
            <tr>
                <td class="table-title">Sitograph CMS</td>
                <td class="text-center" onclick="table_type(1);"><span class="setup_reqired">setup required</span></td>
                <td class="text-center" onclick="table_type(2);"><span class="glyphicon glyphicon-ok"></span></td>
                <td class="text-center" onclick="table_type(3);"><span class="glyphicon glyphicon-ok"></span></td>
                <td class="text-center text-muted" onclick="table_type(4);"><span class="glyphicon glyphicon-ok"></span></td>
            </tr>
            <tr>
                <td class="table-title">Design Theme</td>
                <td class="text-center" onclick="table_type(1);"><span class="setup_reqired">setup required</span></td>
                <td onclick="table_type(2);"><b>Theme Default</b></td>
                <td onclick="table_type(3);"><b>Theme Sitograph</b></td>
                <td class="text-muted" onclick="table_type(4);"><b>Theme Catalog</b></td>
            </tr>
            <tr>
                <td class="table-title">Website Modules<br><small>Blog, Feedback, Gallery, Site search</small></td>
                <td class="text-center" onclick="table_type(1);"><span class=setup_reqired">setup required</span></td>
                <td class="text-center" onclick="table_type(2);"><span class="glyphicon glyphicon-ok"></span></td>
                <td class="text-center" onclick="table_type(3);"><span class="glyphicon glyphicon-ok"></span></td>
                <td class="text-center text-muted" onclick="table_type(4);"><span class="glyphicon glyphicon-ok"></span></td>
            </tr>
            <tr>
                <td class="table-title">Google API</td>
                <td class="text-center" onclick="table_type(1);"><span class="glyphicon glyphicon-remove"></span></td>
                <td class="text-center" onclick="table_type(2);"><span class="glyphicon glyphicon-ok"></span></td>
                <td class="text-center" onclick="table_type(3);"><span class="glyphicon glyphicon-ok"></span></td>
                <td class="text-center text-muted" onclick="table_type(4);"><span class="glyphicon glyphicon-ok"></span></td>
            </tr>
            <tr>
                <td class="table-title">Email service</td>
                <td class="text-center" onclick="table_type(1);"><span class="glyphicon glyphicon-remove"></span></td>
                <td class="text-center" onclick="table_type(2);"><span class="glyphicon glyphicon-ok"></span></td>
                <td class="text-center" onclick="table_type(3);"><span class="glyphicon glyphicon-ok"></span></td>
                <td class="text-center text-muted" onclick="table_type(4);"><span class="glyphicon glyphicon-ok"></span></td>
            </tr>
            <tr>
                <td class="table-title">Cart and payments</td>
                <td class="text-center" onclick="table_type(1);"><span class="glyphicon glyphicon-remove"></span></td>
                <td class="text-center" onclick="table_type(2);"><span class="glyphicon glyphicon-remove"></span></td>
                <td class="text-center" onclick="table_type(3);"><span class="glyphicon glyphicon-remove"></span></td>
                <td class="text-center text-muted" onclick="table_type(4);"><span class="glyphicon glyphicon-ok"></span></td>
            </tr>
            <tr>
                <td class="table-title">Email marketing</td>
                <td class="text-center" onclick="table_type(1);"><span class="glyphicon glyphicon-remove"></span></td>
                <td class="text-center" onclick="table_type(2);"><span class="glyphicon glyphicon-remove"></span></td>
                <td class="text-center" onclick="table_type(3);"><span class="glyphicon glyphicon-remove"></span></td>
                <td class="text-center text-muted" onclick="table_type(4);"><span class="glyphicon glyphicon-ok"></span></td>
            </tr>
            <tr class="text-center">
                <td class="table-title">Price</td>
                <td onclick="table_type(1);">
                    <p style="font-size:16px;">FREE</p>
                </td>
                <td onclick="table_type(2);">
                    <p style="font-size:16px;text-decoration: line-through;">4.23$ per month</p>
                    <p style="font-size:16px;color:red;">FREE *</p>
                </td>
                <td onclick="table_type(3);">
                    <p style="font-size:16px;text-decoration: line-through;">4.23$ per month</p>
                    <p style="font-size:16px;color:red;">FREE *</p>
                </td>
                <td onclick="table_type(4);">
                    <p class="text-muted" style="font-size:16px;">49$ per month</p>
                </td>
            </tr>
            <tr class="text-center">
                <td></td>
                <td onclick="table_type(1);"><input type="radio" name="website_type" value="wtype1" id="wtype1"></td>
                <td onclick="table_type(2);"><input type="radio" name="website_type" value="wtype2" id="wtype2"></td>
                <td onclick="table_type(3);"><input type="radio" name="website_type" value="wtype3" id="wtype3"></td>
                <td onclick="table_type(4);"><input type="radio" name="website_type" value="wtype4" id="wtype4" disabled="disabled"></td>
            </tr>
        </table>

        <p><span style="color:red;">*</span> FREE in Open Beta</p>
    </div>
</div>