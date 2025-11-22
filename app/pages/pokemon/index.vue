<style lang="scss">
    .container {
        width: 1200px;
        margin: 0 auto;
        .pokemons {
            gap: .4em;
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            .item {
                border: 1px solid black;
                border-radius: .3em;
                padding: .6em;
                color: black;
                text-decoration: none;
                text-align: center;
                &:hover {
                    transform: scale(1.02);
                    transition: 300ms;
                }
            }
        }
    }
</style>

<template>
    <div class="container">
        <h1>List Pokemon</h1>
        <div class="pokemons" >
            <NuxtLink class="item" v-for="item in results" :key="item.name" :to="`/pokemon/${item.name}`">
                {{ item.name }}
            </NuxtLink>
        </div>
    </div>
</template>

<script setup>
    const data = await useFetch('https://pokeapi.co/api/v2/pokemon')
    const results = data.data.value.results
</script>