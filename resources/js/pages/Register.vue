<template>
     <div id="backend-view">
     <div class="container mt-5">
        <div class="row">
            <div class="col-md-6 mx-auto">
                   <form @submit.prevent="submit">

                    <div class="mb-3">
                        <label for="name" class="form-label">Name</label>
                        <input type="text" id="name" v-model="fields.name" class="form-control">
                        <span class="text-danger" v-if="errors.name">{{errors.name[0]}}</span>
                    </div>
                    <div class="mb-3">
                        <label for="email" class="form-label">Email address</label>
                        <input type="text" id="email" v-model="fields.email" class="form-control">
                        <span class="text-danger" v-if="errors.email">{{errors.email[0]}}</span>
                    </div>
                    <div class="mb-3">
                        <label for="password" class="form-label">Password</label>
                        <input type="password" class="form-control" v-model="fields.password" id="password">
                        <span class="text-danger" v-if="errors.password">{{errors.password[0]}}</span>

                    </div>
                    <div class="mb-3">
                        <label for="password_confirmation" class="form-label">Password</label>
                        <input  type="password" class="form-control" v-model="fields.password_confirmation" id="password_confirmation">
                        <span class="text-danger" v-if="errors.password_confirmation">{{errors.password_confirmation[0]}}</span>

                    </div>
                    
                    <button type="submit" class="btn btn-primary">Sign Up</button>
                    &nbsp; &nbsp; <span>Already have an account?</span> <router-link :to="{name: 'Login'}">Login</router-link>
                </form>
            </div>
        </div>
     </div>

    </div>
</template>

<script>
export default {
    data(){
        return{
            fields:{},
            errors: {}
        }
    },


    methods:{
        submit(){
           axios
             .post('/api/register', this.fields)
             .then(()=>{
                this.$router.push({name:'Dashboard'});
             }).catch((error)=>{
                this.errors = error.response.data.errors 
             })
        }
    }
}
</script>