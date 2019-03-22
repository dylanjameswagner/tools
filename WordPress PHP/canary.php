<?php if ( false ) : ?>
	<style>
	.alert {
		position: relative;
		margin-top: 0;
		padding: 2rem 0;
		background-color: #cc0000;
		color: white;
		text-align: left;
		font-size: 18px;
	}
	.alert__inner {
		max-width: 1400px;
		margin: 0 auto;
		padding-right: 4.57143%;
		padding-left: 4.57143%;
	}
	@media (min-width: 1400px) {
		.alert__inner {
			padding-right: 64px;
			padding-left: 64px;
		}
	}
	.alert__inner::before {
		content: '!';
		display: block;
		float: left;
		width: 1.8rem;
		height: 1.8rem;
		margin-right: 0.8rem;
		border-radius: 50%;
		background-color: white;
		color: #cc0000;
		text-align: center;
		font-weight: 16px;
		font-size: 16px;
		line-height: 1.8rem;
	}
	.alert__inner h1 {
		font-family: inherit;
		font-weight: inherit;
		font-size: inherit;
	}
	.alert__inner h1,
	.alert__inner p {
		/* padding-right: 5rem; */
	}
	@media (min-width: 1024px) {
		.alert__inner h1,
		.alert__inner p {
			max-width: 72%;
			padding-right: 0;
		}
	}
	</style>
	<section class="alert">
		<div class="alert__inner">
			<h1><?php _e( 'NOTICE:', 'carbon' ); ?></h1>
			<p>
				<?php _e( 'This website has been migrated to new hosting, if you are seeing this notification please contact your website administrator immediately so your access to the website can be corrected.', 'carbon' ); ?>
			</p>
		</div>
	</section>
<?php endif; ?>
