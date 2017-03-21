<% /** Contributors:   Tony Morano  */%>

<!-- #NAVIGATION -->
<!-- Left panel : Navigation area -->
<!-- Note: This width of the aside area can be adjusted through LESS variables -->
<aside id="left-panel">

    <!-- User info -->
    <div class="login-info">
            <span> <!-- User image size is adjusted inside CSS, it should stay as it -->

                <a href="javascript:void(0);" id="show-shortcut" data-action="toggleShortcut">
                    <div>
                        <img src="/static/img/avatars/sunny.png" alt="me" class="online"/>
                            <span>
                                ${username}
                            </span>
                    </div>
                            <i class="fa fa-angle-down"></i>
                </a>

            </span>
    </div>
    <!-- end user info -->

    <nav>
        <!--
        NOTE: Notice the gaps after each icon usage <i></i>..
        Please note that these links work a bit different than
        traditional href="" links. See documentation for details.
        -->

        <ul>
            <li>
                <a href="#" title="Dashboard"><i class="fa fa-lg fa-fw fa-home"></i> <span class="menu-item-parent">Engineer</span></a>
                <ul>
                    <li>
                        <a href="/engineer" title ="Engineer Dashboard"><span class="menu-item-parent">Engineer Dashboard</span></a>
                    </li>
                    <li>
                        <a href="/timecard" title="Dashboard"><span class="menu-item-parent">Submit Timecard</span></a>
                    </li>
                    <li class="">
                        <a href="#" title="My Timecards"><span
                                class="menu-item-parent">My Timecards</span></a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="#" title="Payroll"><i class="fa fa-lg fa-fw fa-dollar"></i> <span class="menu-item-parent">Payroll</span></a>
                <ul>
                    <li>
                        <a href="/payroll" title="Dashboard"><span class="menu-item-parent">Admin Dashboard</span></a>
                    </li>
                    <li class="">
                        <a href="dashboard-social.html" title="Dashboard"><span
                                class="menu-item-parent">Review</span></a>
                    </li>
                </ul>
            </li>
        </ul>
    </nav>

    <span class="minifyme" data-action="minifyMenu">
				<i class="fa fa-arrow-circle-right hit"></i>
			</span>

</aside>
<!-- END NAVIGATION -->