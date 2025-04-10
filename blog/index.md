Blogs

<script setup>
import { trackEvent } from '../src/utils/analytics';

function handleButtonClick() {
  trackEvent('Home', 'CTA Click', 'Main Button');
}
</script>

<button @click="handleButtonClick">Click Me</button>
