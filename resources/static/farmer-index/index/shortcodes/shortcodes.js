$(document).ready(function(){
    //slider
    $('.headerSlider').each(function(){
        var slider = $(this);
        var slider_slides_separator = 18; //space between 2 slides in px, must correspond to css
        var slider_time = 1000; //time for slide transitions in miliseconds
        var slider_slides_visible = 3; //nr of slides visible
        var slider_slides_indent = 3; //nr of slides to increment/decrement
        var slider_left = slider.children('.headerSliderLeft');
        var slider_right = slider.children('.headerSliderRight');
        var slider_container = slider.children('.headerSliderMiddle').children('ul');
        var slider_slides = slider_container.children('li');
        var slider_slides_nr = slider_slides.length;
        var slider_slides_width = slider_slides.outerWidth();
        var slider_container_width = slider_slides_nr*slider_slides_width+(slider_slides_nr-1)*slider_slides_separator;
        var slider_count = 0;
        var slider_count_max = slider_slides_nr-slider_slides_visible;
        slider_count_max = Math.max(0,slider_count_max);
        slider_container.css('width',slider_container_width+'px');
        slider_left.click(function(){
            var slider_count_new = slider_count;
            slider_count_new -= slider_slides_indent;
            slider_count_new = Math.max(0,slider_count_new);
            if(slider_count_new!=slider_count){
                var slider_count_delta = Math.abs(slider_count_new-slider_count);
                var slider_time_needed;
                if(slider_count_delta<slider_slides_indent)
                    slider_time_needed = slider_time*slider_count_delta/slider_slides_indent;
                else
                    slider_time_needed = slider_time;
                var slider_margin = -slider_count_new*(slider_slides_width+slider_slides_separator);
                slider_container.stop().animate({'margin-left':slider_margin+'px'},{duration:slider_time_needed,queue:false});
                slider_count = slider_count_new;
            }
        });
        slider_right.click(function(){
            var slider_count_new = slider_count;
            slider_count_new += slider_slides_indent;
            slider_count_new = Math.min(slider_count_new,slider_count_max);
            if(slider_count_new!=slider_count){
                var slider_count_delta = Math.abs(slider_count_new-slider_count);
                var slider_time_needed;
                if(slider_count_delta<slider_slides_indent)
                    slider_time_needed = slider_time*slider_count_delta/slider_slides_indent;
                else
                    slider_time_needed = slider_time;
                var slider_margin = -slider_count_new*(slider_slides_width+slider_slides_separator);
                slider_container.stop().animate({'margin-left':slider_margin+'px'},{duration:slider_time_needed,queue:false});
                slider_count = slider_count_new;
            }
        });
        slider.mousedown(function(){
            return false;
        });
    });
    //photostream
    $('.blogojoyFlickrWidget').each(function(){
        var stream = $(this);
        var stream_container = stream.find('.blogojoyFlickrWidgetStream');
        var stream_userid = stream_container.attr('data-userid');
        var stream_items = parseInt(stream_container.attr('data-items'));
        $.getJSON("http://api.flickr.com/services/feeds/photos_public.gne?lang=en-us&format=json&id="+stream_userid+"&jsoncallback=?", function(stream_feed){
            for(var i=0;i<stream_items&&i<stream_feed.items.length;i++)
                if(stream_feed.items[i].media.m)
                    stream_container.append('<div class="blogojoyFlickrWidgetStreamImage"><img src="'+stream_feed.items[i].media.m+'" alt="" /></div>');
        });
    });
    //twitter
    $('.blogojoyTwitterWidget').each(function(){
        var t = $(this);
        var t_container = t.find('.blogojoyTwitterWidgetMessages');
        var t_user = t_container.attr('data-user');
        var t_posts = parseInt(t_container.attr('data-posts'));
        $.getJSON("http://api.twitter.com/1/statuses/user_timeline/"+t_user+".json?callback=?", function(t_tweets){
            for(var i=0;i<t_posts&&i<t_tweets.length;i++){
                console.log(t_tweets);
                var t_author = t_tweets[i].user.screen_name?t_tweets[i].user.screen_name:t_tweets[i].user.name;
                var t_message =
                    '<div class="blogojoyTwitterWidgetMessagesEntry">'+
                        '<div class="blogojoyTwitterWidgetMessagesEntryText">'+
                            linkify(t_tweets[i].text)+
                        '</div>'+
                        '<div class="blogojoyTwitterWidgetMessagesEntryFooter">'+
                            '<span class="blogojoyTwitterWidgetMessagesEntryFooterDate">'+
                                t_tweets[i].created_at.substring(11, t_tweets[i].created_at.length-14)+
                                ' '+
                                t_tweets[i].created_at.substring(4, t_tweets[i].created_at.length-20)+
                            '</span>'+
                            ' from '+
                            '<a class="blogojoyTwitterWidgetMessagesEntryFooterAuthor" href="http://twitter.com/'+t_author+'">'+
                                t_author+
                            '</a>'+
                        '</div>'+
                    '</div>';
                t_container.append(t_message);
            }
        });
    });
    //submit posts
    $('.profileSubmit .profileSubmitOptions').each(function(){
        var t = $(this);
        var t_li_all = t.children('li');
        var t_li_current = t.children('li.profileSubmitOptionsActive');
        t_li_all.click(function(){
            if(this!=t_li_current[0]){
                t_li_current.removeClass('profileSubmitOptionsActive');
                t_li_current = $(this);
                t_li_current.addClass('profileSubmitOptionsActive');
            }
        });
    });
    //settings file browse
    (function (){
		var file_input = $('.profileSettingsFile');
        var fake_input = $('.profileSettingsFake');
        var broswe_button = $('.profileSettingsBrowse');
		broswe_button.click(function(){
			try { //in firefox
				file_input.click();
				return;
			} catch(ex) {}
			try { // in chrome
				if(document.createEvent) {
					var e = document.createEvent('MouseEvents');
					e.initEvent( 'click', true, true );
					file_input.dispatchEvent(e);
					return;
				}
			} catch(ex) {}
			try { // in IE
				if(document.createEventObject) {
					var evObj = document.createEventObject();
					file_input.fireEvent("onclick", evObj);
					return;
				}
			} catch(ex) {}
		});
		file_input.change(function(){
			var path = $(this).val()
			if(path.match(/fakepath/)) {
				path = path.replace(/C:\\fakepath\\/i, '');
			}
			fake_input.val(path);
		});
    })();
    //-shortcodes-start-
    //tabs
    $('.rs_tabs').each(function(){
        var t_duration = 300; //duration of toggle animation in miliseconds
        var t = $(this);
        var t_nav = t.children('.rs_tabs_nav').children('li');
        var t_nav_array = $.makeArray(t_nav);
        var t_content = t.children('.rs_tabs_content');
        var t_pages = t_content.children('.rs_tabs_content_page');
        var t_page_first = t_pages.filter('.rs_tabs_content_page_active');
        t_page_first.css('display','block');
        t_content.css({height:t_page_first.outerHeight(true)});
        if(t.hasClass('rs_tabs_left')||t.hasClass('rs_tabs_right'))
            t_content.css('min-height',t.children('.rs_tabs_nav').outerHeight(true)+'px');
        t_nav.click(function(){
            var t_nav_old = t_nav.filter('.rs_tabs_nav_active').not(this);
            if(t_nav_old.length){
                t_nav_old.removeClass('rs_tabs_nav_active');
                $(this).addClass('rs_tabs_nav_active');
                var t_page_old = t_pages.filter('.rs_tabs_content_page_active');
                t_page_old.removeClass('rs_tabs_content_page_active').stop().animate({opacity:'toggle'},{duration:t_duration,queue:false});
                var t_nav_index = t_nav_array.indexOf(this);
                var t_page_current = t_pages.filter(':eq('+t_nav_index+')');
                t_page_current.addClass('rs_tabs_content_page_active').stop().animate({opacity:'toggle'},{duration:t_duration,queue:false});
                t_content.css({height:t_page_current.outerHeight(true)});
            }
        });
    });
    //toggle
    $('.rs_toggle').each(function(){
        var t_duration = 300; //duration of toggle animation in miliseconds
        var t = $(this);
        var t_title = t.children('.rs_toggle_title');
        var t_content = t.children('.rs_toggle_content');
        t_title.click(function(){
            if(t.hasClass('rs_toggle_opened'))
                t.removeClass('rs_toggle_opened');
            else
                t.addClass('rs_toggle_opened');
            t_content.stop().animate({opacity:'toggle',height:'toggle',paddingTop:'toggle',paddingBottom:'toggle'},{duration:t_duration,queue:false});
        });
    });
    //accordion
    $('.rs_accordion').each(function(){
        var t_duration = 300; //duration of toggle animation in miliseconds
        var t = $(this);
        var t_items = t.children('.rs_accordion_item');
        t_items.filter('.rs_accordion_item_active').children('.rs_accordion_item_content').css('display','block');
        t_items.children('.rs_accordion_item_title').click(function(){
            var t_item_current = $(this).parent();
            var t_item_old = t_items.filter('.rs_accordion_item_active').not(t_item_current);
            if(t_item_old.length){
                t_item_old.removeClass('rs_accordion_item_active').children('.rs_accordion_item_content').stop().animate({opacity:'toggle',height:'toggle',paddingTop:'toggle',paddingBottom:'toggle'},{duration:t_duration,queue:false,complete:function(){
                    
                }});
                t_item_current.addClass('rs_accordion_item_active').children('.rs_accordion_item_content').stop().animate({opacity:'toggle',height:'toggle',paddingTop:'toggle',paddingBottom:'toggle'},{duration:t_duration,queue:false,complete:function(){
                    
                }});
            }
        });
    });
});
function linkify(text){
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
if (!Array.prototype.indexOf) {
    Array.prototype.indexOf = function(obj, start) {
        for (var i = (start || 0), j = this.length; i < j; i++) {
            if (this[i] === obj) { return i; }
        }
        return -1;
    }
}