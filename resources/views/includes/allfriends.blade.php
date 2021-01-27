 <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                <a class="nav-link {{($_SERVER['REQUEST_URI']=='/net')?'active':''}}" id="v-pills-search_friend-tab"  href="{{asset('net')}}">{{__('menu.net_page.find_friends')}}</a>
                <a class="nav-link {{($_SERVER['REQUEST_URI']=='/net/friends')?'active':''}}" id="v-pills-last_user_friends-tab" href="{{asset('net/friends')}}" >{{__('menu.net_page.friends')}}</a>

            </div>