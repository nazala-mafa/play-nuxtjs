<style lang="scss">
.pokemon-name-index.container {
    max-width: 1200px;
    .card {
        border: 1px solid #999;
        padding: .4em;
        border-radius: .4em;
        margin-bottom: 1em;
        &__body {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            &__label {
                font-weight: bold;
            }
            &__value {
                display: flex;
                gap: .2em;
                &__type {
                    color: #333;
                    text-decoration: none;
                    border: 1px solid #333;
                    transition: 300ms;
                    padding: 4px 8px;
                    border-radius: 4px;
                    &:hover {
                      color: #999;  
                        border: 1px solid #333;
                    }
                }
            }
        }
    }
}
</style>

<template>
    <div class="pokemon-name-index container">
        <h1>Detail Pokemon</h1>
        <div class="card">
            <div class="card__body">
                <div class="card__body__label">Name</div>
                <div class="card__body__value">: {{ pokemon.name }}</div>
            </div>
            <div class="card__body">
                <div class="card__body__label">Height</div>
                <div class="card__body__value">: {{ pokemon.height }}</div>
            </div>
            <div class="card__body">
                <div class="card__body__label">Weight</div>
                <div class="card__body__value">: {{ pokemon.weight }}</div>
            </div>
            <div class="card__body">
                <div class="card__body__label">Types</div>
                <div class="card__body__value">: <NuxtLink :to="`/pokemon/type/${type.type.name}`" class="card__body__value__type"
                        v-for="type in pokemon.types" :key="type.slot">{{ type.type.name }}</NuxtLink>
                </div>
            </div>
            <img :src="pokemon.sprites.front_default" alt="">
        </div>
        <div class="card">
            <div class="card__body" v-for="stat in pokemon.stats" :key="stat.stat.name">
                <div class="card__body__label">{{ stat.stat.name }}</div>
                <div class="card__body__value">: {{ stat.base_stat }}</div>
            </div>
        </div>
        <div class="card">
            <div class="card__body" v-for="ability in pokemon.abilities" :key="ability.ability.name">
                <div class="card__body__label">{{ ability.ability.name }}</div>
                <div class="card__body__value">: {{ ability.slot }}</div>
            </div>
        </div>
        <div class="card">
            <div class="card__body" v-for="move in pokemon.moves" :key="move.move.name">
                <div class="card__body__label">{{ move.move.name }}</div>
            </div>
        </div>
    </div>
</template>

<script setup lang="ts">
import type { Pokemon } from '~/types/pokemon';

const route = useRoute();
const res = await useFetch(`https://pokeapi.co/api/v2/pokemon/${route.params.name}`);
const pokemon = res.data.value as Pokemon;
</script>