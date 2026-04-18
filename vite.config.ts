import tailwindcss from '@tailwindcss/vite'
import { sveltekit } from '@sveltejs/kit/vite'
import { defineConfig } from 'vite'
import Icons from 'unplugin-icons/vite'

export default defineConfig({
	plugins: [sveltekit(), Icons({ compiler: 'svelte', scale: 1 }), tailwindcss()],
	server: {
	    // Add the oxytone server's own hostname, and any aliases, to the below list
	    allowedHosts: []
	  }
})
