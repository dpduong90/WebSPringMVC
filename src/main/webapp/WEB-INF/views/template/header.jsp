<header class="header">
    <div class="header-block header-block-nav">
        <ul class="nav-profile">
            <li class="profile dropdown">
                <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                    <img class="img" style="background-image: url('https://www.muvizz.com/images/icon/default-user.png')" /> 
                    <span class="name"> ${loggedinuser} </span> 
                </a>
                <div class="dropdown-menu profile-dropdown-menu" aria-labelledby="dropdownMenu1">
                    <a class="dropdown-item" href="#"> <i class="fa fa-user icon"></i> Profile </a>
                    <a class="dropdown-item" data-toggle='modal' href='#modal-media'> <i class="fa fa-key icon"></i> Change password </a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="<c:url value="/logout" />"> <i class="fa fa-power-off icon"></i> Logout </a>
                </div>
            </li>
        </ul>
    </div>
</header>