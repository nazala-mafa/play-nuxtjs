<template>
  <div>
    <NuxtRouteAnnouncer />
    <h1>Hello World</h1>
    <ul>
      <li>
        <NuxtLink to="/">Home</NuxtLink>
      </li>
      <li>
        <NuxtLink to="/product">Product</NuxtLink>
      </li>
      <li>
        <NuxtLink to="/service">Service</NuxtLink>
      </li>
      <li>
        <NuxtLink to="/pokemon">Pekemon</NuxtLink>
      </li>
    </ul>

    <NuxtPage />
  </div>
</template>

<script setup>
  useHead({
    title: 'Aplikasi Testing NuxtJs',
    meta: [
      { name: 'description', content: 'Deskripsi singkat halaman ini' },
      { property: 'og:title', content: 'Judul OG' },
      { property: 'og:description', content: 'Deskripsi OG' },
    ]
  })
</script>