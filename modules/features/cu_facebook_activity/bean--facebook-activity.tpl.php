<?php

/**
 * @file
 * Template file for facebook activity bean.
 */
 ?>
<iframe class="iframe-facebook-activity" src="//www.facebook.com/plugins/likebox.php?href=<?php print urlencode(render($content['field_fb_url'][0]['#element']['url'])); ?>&amp;colorscheme=light&amp;height=560&amp;show_faces=<?php print render($content['field_fb_like_faces'][0]['#markup']); ?>&amp;border_color&amp;stream=true&amp;header=false&amp;appId=137301796349387" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:100%; height:580px;" allowTransparency="true"></iframe>
