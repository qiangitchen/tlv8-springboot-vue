<template>
	<div style="width: 100%; height: 100%; overflow: hidden; padding: 5px;">
		<iframe :src="pageUrl" style="height: calc(100% - 2px); width: 100%; margin: 0; border: 0;"> </iframe>
	</div>
</template>

<script>
export default {
  setup() {
    const pageUrl = '/tlv8/SA/doc/docCenter/mainActivity.html';
    return { pageUrl };
  }
};
</script>
