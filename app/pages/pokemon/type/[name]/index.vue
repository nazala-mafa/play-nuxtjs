<style lang="scss">
.pokemon-type-name-index.container {
    max-width: 1200px;
    margin: auto;

    &__type {
        text-transform: uppercase;
    }

    .card {
        border: 1px solid #ccc;
        padding: .4em;
        border-radius: .2em;
        margin-bottom: 1em;

        &__title {
            margin: 0 0 .4em;
            font-size: 1.4em;

            span {
                text-transform: capitalize;
                margin-right: .2em;
            }
        }

        &__body {
            margin-left: 1em;
            &__title {
                font-size: 1em;
                color: #333;
                margin: 0;
                text-transform: capitalize;
            }

            &__items {
                display: flex;
                flex-wrap: wrap;
                gap: .2em;
                margin: .4em 0;

                &__item {
                    color: #333;
                    text-decoration: none;
                    border: 1px solid #333;
                    border-radius: .3em;
                    padding: .3em .8em;
                    text-transform: capitalize;
                    transition: .3s;
                    &:hover {
                        background: #333;
                        color: #ccc;
                        cursor: pointer;
                        transform: scale(1.1);
                    }
                }
            }
        }
    }
}
</style>

<template lang="pug">
    div.pokemon-type-name-index.container
        h1 Detail Pokemon type - 
            span.container__type {{ type.name }}
        .card
            h2.card__title Damage Effect
            .card__body(v-for="item in Object.keys(type.damage_relations)" :key="item")
                h3.card__body__title {{ item.replaceAll('_', ' ') }}
                .card__body__items
                    NuxtLink.card__body__items__item(
                        v-for="item2 in type.damage_relations[item]" 
                        :to="`/pokemon/type/${item2.name}`" 
                        :key="item2"
                    ) {{ item2.name }}
        .card
            h2.card__title 
                span {{ type.name }} 
                span Pokemon
            .card__body
                .card__body__items
                    NuxtLink.card__body__items__item(
                        v-for="item3 in type.pokemon"
                        :to="`/pokemon/${item3.pokemon.name}`" 
                        :key="item3"
                    ) {{ item3.pokemon.name }}

</template>

<script setup>
const route = useRoute();
const res = await useFetch(`https://pokeapi.co/api/v2/type/${route.params.name}`);
const type = res.data.value;
console.log( type.pokemon );
console.log( Object.keys(type) );

</script>