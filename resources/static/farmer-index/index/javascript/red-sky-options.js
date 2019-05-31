var t_browser_has_css3;
var t_css3_array = ['transition','-webkit-transition','-moz-transition','-o-transition','-ms-transition'];
var t_css3_index;
$(document).ready(function(){
    var t_css3_test = $('body');
    for(t_css3_index=0, t_css3_test.css(t_css3_array[t_css3_index],'');t_css3_index<t_css3_array.length&&null==t_css3_test.css(t_css3_array[t_css3_index]);t_css3_test.css(t_css3_array[++t_css3_index],''));
    if(t_css3_index<t_css3_array.length)
        t_browser_has_css3 = true;
    else
        t_browser_has_css3 = false;
    load_pretty();
    load_tooltips();
    load_slider();
    load_photostream();
    load_twitter();
    load_toggle();
    load_carousel();
    load_tabs();
    load_gallery();
});



//PRETTYPHOTO
var load_pretty = function(){
    $('.pretty').prettyPhoto();
};



//TITLE TOOL
var load_tooltips = function(){
    var custom_top = 0;
    var custom_left = 15;
    var fade_time = 0;

    var ShowTooltip = function (e) {
        var text = $(this).next('.show-tooltip-text');
        if (text.attr('class') != 'show-tooltip-text') return false;

        text.fadeIn(fade_time, function () {
            var text_width = text.outerWidth();
            var left = e.clientX + custom_left;
            if (left + text_width > $(window).width()) left = e.clientX - text_width - custom_left;
            text.css('top', e.clientY + custom_top).css('left', left);
        })


        $(this).on('mousemove', MoveTooltip);
        return false;
    }
    var HideTooltip = function (e) {
        var text = $(this).next('.show-tooltip-text');
        if (text.attr('class') != 'show-tooltip-text') return false;

        text.fadeOut(fade_time);

        $(this).off('mousemove');
    }

    var SetupTooltips = function () {
        $('.show-tooltip').each(function () {
            $(this).after($('<span/>').attr('class', 'show-tooltip-text').html($(this).attr('title'))).attr('title', '');
        }).hover(ShowTooltip, HideTooltip);
    }

    var MoveTooltip = function (e) {
        var text = $(this).next('.show-tooltip-text');
        var text_width = text.outerWidth();
        var left = e.clientX + custom_left;
        if (left + text_width > $(window).width()) left = e.clientX - text_width - custom_left;
        text.css({
            top: e.clientY + custom_top,
            left: left
        });
    }
    
    SetupTooltips();
};



// SLIDER 
var load_slider = function(){
    $('.skywalkerSlider').each(function(){
        var t_time_slide = 200;   //time of slide transition animation in miliseconds
        var t_time_slide_box = 200;   //time of slide info box fade animation in miliseconds
        var t_time_preview = 200;   //time of preview items movements in miliseconds
        var t_time_preview_hover = 200;   //time of preview item hover effect animation in miliseconds
        var t_time_preview_marker = 200;   //time of preview marker movement in miliseconds
        var t_autoplay_time = 2000;   //interval for autoplay to switch the slides in miliseconds; *NOTE: animation time and autoplay interval are independent from each other, thus autoplay interval must be equal or less then animation time, in other case there will be more then one slide executing its transition animation (recomemnded values for autoplay interval: 1/2 of animation time or less)
        var t_autoplay_time_resume = 3000;   //time for the autoplay to resume in miliseconds
        var t_preview_items_visible = 4;   //nr of items visible in the preview box; *NOTE: this is not a configuration option
        var t_preview_items_width = 240;   //width of an item in the preview box in pixels (width + padding + border +margin); *NOTE; this is not a configuration option
        var t = $(this);
        var t_marker = t.children('.skywalkerSliderMarker');
        var t_marker_value = 0;
        var t_preview_items_width_css = t_preview_items_width+'px';
        var t_preview_items_width_css_small = t_preview_items_width-1+'px';
        var t_marker_value_maximum = t_preview_items_visible-1;
        var t_content = t.children('.skywalkerSliderContent');
        var t_content_items = t_content.children('.skywalkerSliderContentItem');
        var t_preview = t.children('.skywalkerSliderPreview');
        var t_preview_items = t_preview.children('.skywalkerSliderPreviewItem');
        var t_preview_items_opacity = t_preview_items.children('.skywalkerSliderPreviewItemOpacity');
        var t_preview_items_total = t_preview_items.length;
        var t_preview_value = 0;
        var t_preview_value_maximum = t_preview_items_total-1;
        var t_preview_items_array = $.makeArray(t_preview_items);
        var t_content_box = t_content_items.children('.skywalkerSliderContentItemBox');
        var t_content_left = t_content_box.children('.skywalkerSliderContentItemBoxPrev');
        var t_content_right = t_content_box.children('.skywalkerSliderContentItemBoxNext');
        var t_preview_overflow = t_preview_items_total>4;
        var t_interval = 0;
        var t_timeout = 0;
        if(t_browser_has_css3){
            t_content_items.css(t_css3_array[t_css3_index],'opacity '+t_time_slide/1000+'s linear');
            t_content_box.css(t_css3_array[t_css3_index],'opacity '+t_time_slide_box/1000+'s ease-in-out');
            t_preview.css(t_css3_array[t_css3_index],'margin-left '+t_time_preview/1000+'s ease-in-out');
            t_preview_items_opacity.css(t_css3_array[t_css3_index],'background-color '+t_time_preview_hover/1000+'s ease-in-out');
            t_marker.css(t_css3_array[t_css3_index],'width,margin-left '+t_time_preview_marker/1000+'s ease-in-out');
        }
        else{
            t_preview_items_opacity.css({
                'background-color':'white',
                opacity:0.7
            });
            t_preview_items_opacity.hover(function(){
                $(this).stop().animate({
                    opacity:0
                },{
                    duration:t_time_preview_hover,
                    queue:false
                });
            },function(){
                $(this).stop().animate({
                    opacity:0.7
                },{
                    duration:t_time_preview_hover,
                    queue:false
                });
            });
            t_content_box.hover(function(){
                $(this).stop().animate({
                    opacity:1
                },{
                    duration:t_time_slide_box,
                    queue:false
                });
            },function(){
                $(this).stop().animate({
                    opacity:0
                },{
                    duration:t_time_slide_box,
                    queue:false
                });
            });
        }
        var t_content_transition = function(){
            if(t_browser_has_css3){
                t_content_items.filter('.skywalkerSliderContentActive').removeClass('skywalkerSliderContentActive');
                t_content_items.filter(':eq('+t_preview_value+')').addClass('skywalkerSliderContentActive');
            }
            else{
                t_content_items.filter('.skywalkerSliderContentActive').removeClass('skywalkerSliderContentActive').stop().animate({
                    opacity:0
                },{
                    duration:t_time_slide,
                    queue:false
                });
                t_content_items.filter(':eq('+t_preview_value+')').addClass('skywalkerSliderContentActive').stop().animate({
                    opacity:1
                },{
                    duration:t_time_slide,
                    queue:false
                });
            }
        }
        var t_preview_transition = function(){
            if(t_browser_has_css3){
                t_preview_items.filter('.skywalkerSliderPreviewActive').removeClass('skywalkerSliderPreviewActive');
                t_preview_items.filter(':eq('+t_preview_value+')').addClass('skywalkerSliderPreviewActive');
            }
            else{
                t_preview_items.filter('.skywalkerSliderPreviewActive').removeClass('skywalkerSliderPreviewActive').children('.skywalkerSliderPreviewItemOpacity').stop().animate({
                    opacity:0
                },{
                    duration:t_time_preview_hover,
                    queue:false
                });
                t_preview_items.filter(':eq('+t_preview_value+')').addClass('skywalkerSliderPreviewActive').children('.skywalkerSliderPreviewItemOpacity').stop().animate({
                    opacity:0.7
                },{
                    duration:t_time_preview_hover,
                    queue:false
                });
            }
        }
        var t_autoplay_start;
        var t_autoplay_stop_resume;
        var t_left_transition;
        var t_right_transition;
        var t_left_function;
        var t_right_function;
        t_left_function = function(){
            t_left_transition();
            t_autoplay_stop_resume();
        }
        t_right_function = function(){
            t_right_transition();
            t_autoplay_stop_resume();
        }
        t_autoplay_start = function(){
            t_interval = setInterval(t_right_transition, t_autoplay_time);
        }
        t_autoplay_stop_resume = function(){
            clearInterval(t_interval);
            clearTimeout(t_timeout);
            t_timeout = setTimeout(t_autoplay_start, t_autoplay_time_resume);
        }
        if(t_preview_overflow){
            if(t_browser_has_css3)
                t_preview.css('width',t_preview_items_width*t_preview_items_total);
            else
                t_preview.stop().animate({
                    width:t_preview_items_width*t_preview_items_total
                },{
                    duration:t_time_preview,
                    queue:false
                });
            var t_button_left = $('<div>').addClass('skywalkerSliderLeft');
            var t_button_right = $('<div>').addClass('skywalkerSliderRight');
            t.append(t_button_left).append(t_button_right);
            var t_preview_view_maximum = t_preview_items_total-t_preview_items_visible;
            var t_preview_view_minimum = t_preview_items_visible-1;
            t_left_transition = function(){
                t_preview_value--;
                if(t_preview_value<0){
                    t_preview_value = t_preview_value_maximum;
                    if(t_browser_has_css3)
                        t_preview.css('margin-left',-t_preview_items_width*t_preview_view_maximum);
                    else
                        t_preview.stop().animate({
                            marginLeft:-t_preview_items_width*t_preview_view_maximum
                        },{
                            duration:t_time_preview,
                            queue:false
                        });
                    t_marker_value = t_marker_value_maximum;
                    if(t_browser_has_css3)
                        t_marker.css({
                            marginLeft:t_preview_items_width*t_marker_value+1+'px',
                            width:t_preview_items_width_css_small
                        });
                    else
                        t_marker.stop().animate({
                            marginLeft:t_preview_items_width*t_marker_value+1+'px',
                            width:t_preview_items_width_css_small
                        },{
                            duration:t_time_preview_marker,
                            queue:false
                        });
                }
                else{
                    if(t_preview_value<t_preview_view_maximum)
                        if(t_browser_has_css3)
                            t_preview.css('margin-left',-t_preview_items_width*t_preview_value);
                        else
                            t_preview.stop().animate({
                                marginLeft:-t_preview_items_width*t_preview_value
                            },{
                                duration:t_time_preview,
                                queue:false
                            });
                    if(t_preview_value){
                        if(t_marker_value>0){
                            t_marker_value--;
                            if(t_browser_has_css3)
                                t_marker.css({
                                    marginLeft:t_preview_items_width*t_marker_value+1+'px'
                                });
                            else
                                t_marker.stop().animate({
                                    marginLeft:t_preview_items_width*t_marker_value+1+'px'
                                },{
                                    duration:t_time_preview_marker,
                                    queue:false
                                });
                        }
                    }
                    else
                    if(t_browser_has_css3)
                        t_marker.css({
                            marginLeft:0,
                            width:t_preview_items_width_css
                        });
                    else
                        t_marker.stop().animate({
                            marginLeft:0,
                            width:t_preview_items_width_css
                        },{
                            duration:t_time_preview_marker,
                            queue:false
                        });
                }
                t_preview_transition();
                t_content_transition();
            }
            t_right_transition = function(){
                t_preview_value++;
                if(t_preview_value>t_preview_value_maximum){
                    t_preview_value = 0;
                    if(t_browser_has_css3)
                        t_preview.css('margin-left',0);
                    else
                        t_preview.stop().animate({
                            marginLeft:0
                        },{
                            duration:t_time_preview,
                            queue:false
                        });
                    t_marker_value = 0;
                    if(t_browser_has_css3)
                        t_marker.css({
                            marginLeft:0,
                            width:t_preview_items_width_css
                        });
                    else
                        t_marker.stop().animate({
                            marginLeft:0,
                            width:t_preview_items_width_css
                        },{
                            duration:t_time_preview_marker,
                            queue:false
                        });
                }
                else{
                    if(t_preview_value>t_preview_view_minimum)
                        if(t_browser_has_css3)
                            t_preview.css('margin-left',-t_preview_items_width*(t_preview_value-t_preview_view_minimum));
                        else
                            t_preview.stop().animate({
                                marginLeft:-t_preview_items_width*(t_preview_value-t_preview_view_minimum)
                            },{
                                duration:t_time_preview,
                                queue:false
                            });
                    if(t_marker_value<t_marker_value_maximum){
                        t_marker_value++;
                        if(t_preview_value!=1)
                            if(t_browser_has_css3)
                                t_marker.css({
                                    marginLeft:t_preview_items_width*t_marker_value+1+'px'
                                });
                            else
                                t_marker.stop().animate({
                                    marginLeft:t_preview_items_width*t_marker_value+1+'px'
                                },{
                                    duration:t_time_preview_marker,
                                    queue:false
                                });
                        else
                        if(t_browser_has_css3)
                            t_marker.css({
                                marginLeft:t_preview_items_width*t_marker_value+1+'px',
                                width:t_preview_items_width_css_small
                            });
                        else
                            t_marker.stop().animate({
                                marginLeft:t_preview_items_width*t_marker_value+1+'px',
                                width:t_preview_items_width_css_small
                            },{
                                duration:t_time_preview_marker,
                                queue:false
                            });
                    }
                }
                t_preview_transition();
                t_content_transition();
            }
            t_button_left.click(t_left_function);
            t_button_right.click(t_right_function);
            t_button_left.mousedown(function(){
                return false;
            });
            t_button_right.mousedown(function(){
                return false;
            });
        }
        else{
            t_left_transition = function(){
                t_preview_value--;
                if(t_preview_value<0){
                    t_preview_value = t_preview_value_maximum;
                    t_marker_value = t_marker_value_maximum;
                    if(t_browser_has_css3)
                        t_marker.css({
                            marginLeft:t_preview_items_width*t_marker_value+1+'px',
                            width:t_preview_items_width_css_small
                        });
                    else
                        t_marker.stop().animate({
                            marginLeft:t_preview_items_width*t_marker_value+1+'px',
                            width:t_preview_items_width_css_small
                        },{
                            duration:t_time_preview_marker,
                            queue:false
                        });
                }
                else{
                    if(t_marker_value>0){
                        t_marker_value--;
                        if(t_preview_value)
                            if(t_browser_has_css3)
                                t_marker.css({
                                    marginLeft:t_preview_items_width*t_marker_value+1+'px'
                                });
                            else
                                t_marker.stop().animate({
                                    marginLeft:t_preview_items_width*t_marker_value+1+'px'
                                },{
                                    duration:t_time_preview_marker,
                                    queue:false
                                });
                        else
                        if(t_browser_has_css3)
                            t_marker.css({
                                marginLeft:0,
                                width:t_preview_items_width_css
                            });
                        else
                            t_marker.stop().animate({
                                marginLeft:0,
                                width:t_preview_items_width_css
                            },{
                                duration:t_time_preview_marker,
                                queue:false
                            });
                    }
                }
                t_preview_transition();
                t_content_transition();
            }
            t_right_transition = function(){
                t_preview_value++;
                if(t_preview_value>t_preview_value_maximum){
                    t_preview_value = 0;
                    t_marker_value = 0;
                    if(t_browser_has_css3)
                        t_marker.css({
                            marginLeft:0,
                            width:t_preview_items_width_css
                        });
                    else
                        t_marker.stop().animate({
                            marginLeft:0,
                            width:t_preview_items_width_css
                        },{
                            duration:t_time_preview_marker,
                            queue:false
                        });
                }
                else{
                    if(t_marker_value<t_marker_value_maximum){
                        t_marker_value++;
                        if(t_preview_value!=1)
                            if(t_browser_has_css3)
                                t_marker.css({
                                    marginLeft:t_preview_items_width*t_marker_value+1+'px'
                                });
                            else
                                t_marker.stop().animate({
                                    marginLeft:t_preview_items_width*t_marker_value+1+'px'
                                },{
                                    duration:t_time_preview_marker,
                                    queue:false
                                });
                        else
                        if(t_browser_has_css3)
                            t_marker.css({
                                marginLeft:t_preview_items_width*t_marker_value+1+'px',
                                width:t_preview_items_width_css_small
                            });
                        else
                            t_marker.stop().animate({
                                marginLeft:t_preview_items_width*t_marker_value+1+'px',
                                width:t_preview_items_width_css_small
                            },{
                                duration:t_time_preview_marker,
                                queue:false
                            });
                    }
                }
                t_preview_transition();
                t_content_transition();
            }
        }
        t_preview_items.click(function(){
            var t_preview_items_active_last = t_preview_items.filter('.skywalkerSliderPreviewActive').not(this);
            if(t_preview_items_active_last.length){
                var t_preview_value_new = t_preview_items_array.indexOf(this);
                t_marker_value += t_preview_value_new-t_preview_value;
                if(!t_preview_value)
                    if(t_browser_has_css3)
                        t_marker.css({
                            marginLeft:t_preview_items_width*t_marker_value+1+'px',
                            width:t_preview_items_width_css_small
                        });
                    else
                        t_marker.stop().animate({
                            marginLeft:t_preview_items_width*t_marker_value+1+'px',
                            width:t_preview_items_width_css_small
                        },{
                            duration:t_time_preview_marker,
                            queue:false
                        });
                else
                if(t_preview_value_new)
                    if(t_browser_has_css3)
                        t_marker.css({
                            marginLeft:t_preview_items_width*t_marker_value+1+'px'
                        });
                    else
                        t_marker.stop().animate({
                            marginLeft:t_preview_items_width*t_marker_value+1+'px'
                        },{
                            duration:t_time_preview_marker,
                            queue:false
                        });
                else
                if(t_browser_has_css3)
                    t_marker.css({
                        marginLeft:0,
                        width:t_preview_items_width_css
                    });
                else
                    t_marker.stop().animate({
                        marginLeft:0,
                        width:t_preview_items_width_css
                    },{
                        duration:t_time_preview_marker,
                        queue:false
                    });
                t_preview_value = t_preview_value_new;
                t_preview_transition();
                t_content_transition();
            }
            t_autoplay_stop_resume();
        });
        t_content.click(function(){
            t_autoplay_stop_resume();
        });
        t.children('.skywalkerSliderResponsiveLeft').click(t_left_function);
        t.children('.skywalkerSliderResponsiveRight').click(t_right_function);
        t_content_left.click(t_left_function);
        t_content_right.click(t_right_function);
        t_autoplay_start();
    });
};



//PHOTOSTREAM
var load_photostream = function(){
    $('.skywalkerPhotostream').each(function(){
        var stream = $(this);
        var stream_userid = stream.attr('data-userid');
        var stream_items = parseInt(stream.attr('data-items'));
        $.getJSON("http://api.flickr.com/services/feeds/photos_public.gne?lang=en-us&format=json&id="+stream_userid+"&jsoncallback=?", function(stream_feed){
            for(var i=0;i<stream_items&&i<stream_feed.items.length;i++){
                var stream_function = function(){
                    if(stream_feed.items[i].media.m){
                        var stream_a = $('<a>').addClass('skywalkerPhotostreamLink').attr('href',stream_feed.items[i].link).attr('target','_blank');
                        var stream_img = $('<img>').addClass('skywalkerPhotostreamImage').attr('src',stream_feed.items[i].media.m).attr('alt','').load(function(){
                            stream_a.append(stream_img);
                            if(stream_img.width()<stream_img.height())
                                stream_img.attr('style','width: 100% !important; height: auto !important;');
                            else
                                stream_img.attr('style','width: auto !important; height: 100% !important;');
                        });
                        stream.append(stream_a);
                    }
                }
                stream_function();
            }
        });
    });
};



//TWITTER
var load_twitter = function(){
    var linkify = function(text){
        text = text.replace(/(https?:\/\/\S+)/gi, function (s) {
            return '<a href="' + s + '">' + s + '</a>';
        });
        text = text.replace(/(^|)@(\w+)/gi, function (s) {
            return '<a href="http://twitter.com/' + s + '">' + s + '</a>';
        });
        text = text.replace(/(^|)#(\w+)/gi, function (s) {
            return '<a href="http://search.twitter.com/search?q=' + s.replace(/#/,'%23') + '">' + s + '</a>';
        });
        return text;
    }
    $('.skywalkerTwitter').each(function(){
        var t = $(this);
        var t_date_obj = new Date();
        var t_loading = 'Loading tweets..'; //message to display before loading tweets
        var t_container = $('<ul>').addClass('twitter').append('<li>'+t_loading+'</li>');
        t.append(t_container);
        var t_user = t.attr('data-user');
        var t_posts = parseInt(t.attr('data-posts'));
        $.getJSON("http://api.twitter.com/1/statuses/user_timeline/"+t_user+".json?callback=?", function(t_tweets){
            t_container.empty();
            for(var i=0;i<t_posts&&i<t_tweets.length;i++){
                var t_date = Math.floor((t_date_obj.getTime()-Date.parse(t_tweets[i].created_at))/1000);
                var t_date_str;
                var t_date_seconds = t_date%60;
                t_date=Math.floor(t_date/60);
                var t_date_minutes = t_date%60;
                if(t_date_minutes){
                    t_date=Math.floor(t_date/60);
                    var t_date_hours = t_date%60;
                    if(t_date_hours){
                        t_date=Math.floor(t_date/60);
                        var t_date_days = t_date%24;
                        if(t_date_days){
                            t_date=Math.floor(t_date/24);
                            var t_date_weeks = t_date%7;
                            if(t_date_weeks)
                                t_date_str = t_date_weeks+' minute'+(1==t_date_weeks?'':'s')+' ago';
                            else
                                t_date_str = t_date_days+' minute'+(1==t_date_days?'':'s')+' ago';
                        }
                        else
                            t_date_str = t_date_hours+' minute'+(1==t_date_hours?'':'s')+' ago';
                    }
                    else
                        t_date_str = t_date_minutes+' minute'+(1==t_date_minutes?'':'s')+' ago';
                }
                else
                    t_date_str = 'less than a minute ago';
                var t_message =
                    '<li'+(i+1==t_tweets.length?' class="last"':'')+'>'+
                        linkify(t_tweets[i].text)+
                        '<span>'+
                            t_date_str+
                        '</span>'+
                    '</li>';
                t_container.append(t_message);
            }
        });
    });
};



//TOP TOGGLE
var load_toggle = function(){
    $('#topline').each(function(){
        var t = $(this);
        var t_button = t.find('.opentop');
        var t_time = 200;   //time for toggling effect in miliseconds
        if(t_browser_has_css3){
            t.css(t_css3_array[t_css3_index],'margin-top '+t_time/1000+'s linear');
            t_button.click(function(){
                if(t_button.html()=='-'){
                    t_button.html('+').stop();
                    t.css('margin-top','-60px');
                }else{
                    t_button.html('-');
                    t.css('margin-top','0px');
                }
            });
        }else{
            t_button.click(function(){
                if(t_button.html()=='-'){
                    t_button.html('+').stop();
                    t.stop().animate({'margin-top':'-60px'},{duration:t_time,queue:false});
                }else{
                    t_button.html('-');
                    t.stop().animate({'margin-top':'0px'},{duration:t_time,queue:false});
                }
            });
        }
    });
};



//CAROUSEL
var load_carousel = function(){
    $('.carousel').each(function(){
        var t_time = 200;   //time for carousel movement in miliseconds
        var t = $(this);
        var t_view = t.children('.carouselView');
        var t_container = t_view.children('.carouselContainer')
        var t_columns = t_container.children('.columns');
        var t_width_first;
        var t_width_last;
        var t_value = 0;
        var t_visible;
        var t_value_nr = t_columns.length;
        var t_value_max;
        var t_back = t.children('.carouselBack');
        var t_next = t.children('.carouselNext');
        var t_w = $(window);
        var t_w_level = -1;
        var t_update = function(width_new){
            if(t_w_level!=3&&width_new<=480){
                t_w_level = 3;
                t_visible = 1;
                t_value_max = t_value_nr - t_visible;
                t_width_first = parseInt(t_columns.filter(':first').outerWidth(true));
                t_width_last = parseInt(t_columns.filter(':last').outerWidth(true));
                t_container.css({width:(t_value_nr-1)*t_width_first+t_width_last});
                t_container.css({marginLeft:-t_value*t_width_first});
            }else if(t_w_level!=2&&width_new>480&&width_new<=767){
                t_w_level = 2;
                t_visible = 1;
                t_value_max = t_value_nr - t_visible;
                t_width_first = parseInt(t_columns.filter(':first').outerWidth(true));
                t_width_last = parseInt(t_columns.filter(':last').outerWidth(true));
                t_container.css({width:(t_value_nr-1)*t_width_first+t_width_last});
                t_container.css({marginLeft:-t_value*t_width_first});
            }else if(t_w_level!=1&&width_new>768&&width_new<=959){
                t_w_level = 1;
                t_visible = 4;
                t_value_max = t_value_nr - t_visible;
                if(t_value>t_value_max)
                    t_value = t_value_max;
                t_width_first = parseInt(t_columns.filter(':first').outerWidth(true));
                t_width_last = parseInt(t_columns.filter(':last').outerWidth(true));
                t_container.css({width:(t_value_nr-1)*t_width_first+t_width_last});
                t_container.css({marginLeft:-t_value*t_width_first});
            }else if(t_w_level!=0&&width_new>960){
                t_w_level = 0;
                t_visible = 4;
                t_value_max = t_value_nr - t_visible;
                if(t_value>t_value_max)
                    t_value = t_value_max;
                t_width_first = parseInt(t_columns.filter(':first').outerWidth(true));
                t_width_last = parseInt(t_columns.filter(':last').outerWidth(true));
                t_container.css({width:(t_value_nr-1)*t_width_first+t_width_last});
                t_container.css({marginLeft:-t_value*t_width_first});
            }
        }
        t_update(t_w.width());
        t_w.resize(function(){
            t_update(t_w.width());
        });
        if(t_browser_has_css3){
            t_container.css(t_css3_array[t_css3_index],'margin-left '+t_time/1000+'s linear');
            t_back.click(function(){
                if(t_value>0){
                    t_value--;
                    t_container.css({marginLeft:-t_value*t_width_first});
                }
            });
            t_next.click(function(){
                if(t_value<t_value_max){
                    t_value++;
                    t_container.css({marginLeft:-t_value*t_width_first});
                }
            });
        }else{
            t_back.click(function(){
                if(t_value>0){
                    t_value--;
                    t_container.stop().animate({marginLeft:-t_value*t_width_first},{duration:t_time,queue:false});
                }
            });
            t_next.click(function(){
                if(t_value<t_value_max){
                    t_value++;
                    t_container.stop().animate({marginLeft:-t_value*t_width_first},{duration:t_time,queue:false});
                }
            });
        }
        t_back.mousedown(function(){
            return false;
        });
        t_next.mousedown(function(){
            return false;
        });
    });
};



//TABS
var load_tabs = function(){
    $('.tabs').each(function(){
        var t_time_fade = 200;   //time of fade effect in miliseconds
        var t_time_height = 200;   //time of height change in miliseconds
        var t = $(this);
        var t_select = t.children('.tab');
        var t_select_active = 'tabActive';   //name of class for active tab button
        var t_select_active_query = '.'+t_select_active;
        var t_select_current = t_select.filter(t_select_active_query);
        var t_select_array = $.makeArray(t_select);
        var t_content = t.children('.content');
        var t_content_active = 'contentActive';   //name of class for active tab content
        var t_content_active_query = '.'+t_content_active;
        t_content.filter(t_content_active_query).css({opacity:1});
        var t_select_height = t_select.outerHeight(true);
        t_content.css({top:t_select_height});
        t.css({height:t_select_height+t_content.filter(t_content_active_query).outerHeight(true)});
        if(t_browser_has_css3){
            t.css(t_css3_array[t_css3_index],'height '+t_time_height/1000+'s linear');
            t_select.css(t_css3_array[t_css3_index],'opacity '+t_time_fade/1000+'s linear');
            t_content.css(t_css3_array[t_css3_index],'opacity '+t_time_fade/1000+'s linear');
            t_select.click(function(){
                if(t_select_current.not(this).length){
                    t_select_current.removeClass(t_select_active);
                    t_select_current = $(this);
                    t_select_current.addClass(t_select_active);
                    var t_select_index = t_select_array.indexOf(this);
                    t_content.filter(t_content_active_query).removeClass(t_content_active).css({opacity:0});
                    t_content.filter(':eq('+t_select_index+')').addClass(t_content_active).css({opacity:1});
                    t.css({height:t_select_height+t_content.filter(t_content_active_query).outerHeight(true)});
                }
            });
        }else{
            t_select.click(function(){
                if(t_select_current.not(this).length){
                    t_select_current.removeClass(t_select_active);
                    t_select_current = $(this);
                    t_select_current.addClass(t_select_active);
                    var t_select_index = t_select_array.indexOf(this);
                    t_content.filter(t_content_active_query).removeClass(t_content_active).stop().animate({opacity:0},{duration:t_time_fade,queue:false});
                    t_content.filter(':eq('+t_select_index+')').addClass(t_content_active).stop().animate({opacity:1},{duration:t_time_fade,queue:false});
                    t.stop().animate({height:t_select_height+t_content.filter(t_content_active_query).outerHeight(true)},{duration:t_time_height,queue:false});
                }
            });
        }
    });
};



//GALLERY
var load_gallery = function(){
    $('.portofolioSlider').each(function(){
        var t_time = 200;   //time for gallery slide effect in miliseconds
        var t = $(this);
        var t_container = t.children('.portofolioSliderContainer');
        var t_images = t_container.children('.image');
        var t_back = t.children('.portofolioSliderBack');
        var t_next = t.children('.portofolioSliderNext');
        var t_value = 0;
        var t_value_nr = t_images.length;
        var t_value_max = t_value_nr-1;
        var t_images_width;
        var t_w = $(window);
        var t_w_level = -1;
        var t_update = function(width_new){
            if(t_w_level!=3&&width_new<=480){
                t_w_level = 3;
                t_images_width = t_images.outerWidth(true);
                t_container.css({marginLeft:-t_value*t_images_width});
            }else if(t_w_level!=2&&width_new>480&&width_new<=767){
                t_w_level = 2;
                t_images_width = t_images.outerWidth(true);
                t_container.css({marginLeft:-t_value*t_images_width});
            }else if(t_w_level!=1&&width_new>768&&width_new<=959){
                t_w_level = 1;
                t_images_width = t_images.outerWidth(true);
                t_container.css({marginLeft:-t_value*t_images_width});
            }else if(t_w_level!=0&&width_new>960){
                t_w_level = 0;
                t_images_width = t_images.outerWidth(true);
                t_container.css({marginLeft:-t_value*t_images_width});
            }
        }
        t_update(t_w.width());
        t_w.resize(function(){
            t_update(t_w.width());
        });
        if(t_browser_has_css3){
            t_container.css(t_css3_array[t_css3_index],'margin-left '+t_time/1000+'s linear');
            t_back.click(function(){
                if(t_value>0){
                    t_value--;
                    t_container.css({marginLeft:-t_value*t_images_width});
                }
            });
            t_next.click(function(){
                if(t_value<t_value_max){
                    t_value++;
                    t_container.css({marginLeft:-t_value*t_images_width});
                }
            });
        }else{
            t_back.click(function(){
                if(t_value>0){
                    t_value--;
                    t_container.stop().animate({marginLeft:-t_value*t_images_width},{duration:t_time,queue:false});
                }
            });
            t_next.click(function(){
                if(t_value<t_value_max){
                    t_value++;
                    t_container.stop().animate({marginLeft:-t_value*t_images_width},{duration:t_time,queue:false});
                }
            });
        }
        t_back.mousedown(function(){
            return false;
        });
        t_next.mousedown(function(){
            return false;
        });
    });
};




//IE fix
if (!Array.prototype.indexOf) {
    Array.prototype.indexOf = function(obj, start) {
        for (var i = (start || 0), j = this.length; i < j; i++) {
            if (this[i] === obj) {return i;}
        }
        return -1;
    }
}