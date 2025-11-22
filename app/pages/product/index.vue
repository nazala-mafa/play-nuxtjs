<template>
    <div>
        <h1>Page Product</h1>
        <div>
            <ul>
                <li v-for="product in products" :key="product.id">
                    <img :src="product.image" :alt="product.name" />
                    <h2>{{ product.name }}</h2>
                    <p>Rp. {{ product.price.toLocaleString('id-ID') }}</p>
                </li>
            </ul>
        </div>
    </div>
</template>

<script setup>
  const { data: products, pending, error } = await useFetch('/json/product.json')
  if (error.value) {
    throw createError({ statusCode: 404, statusMessage: 'Page Not Found', data: error.value })
  }  
</script>
