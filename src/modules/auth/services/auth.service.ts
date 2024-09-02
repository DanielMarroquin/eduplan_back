import { Injectable, UnauthorizedException  } from "@nestjs/common";
import { User } from '../common/entities/user.entity';
import { Repository } from "typeorm";
import { InjectRepository } from '@nestjs/typeorm';


@Injectable()
export class AuthService {
    constructor(
        @InjectRepository(User)

        private userRepository: Repository <User>
    ) {
    }

    async validateUser(username: string, password: string): Promise<User | null> {
        const user = await this.userRepository.findOne({ where: { username } });
        if (!user) {
            return null;
        }

        if (user.password === password) {
            return user;
        } else {
            return null;
        }
    }



    async signIn(username: string, password: string): Promise<{ message: string, success: boolean }> {
        const user = await this.validateUser(username, password);
        if (!user) {
            throw new UnauthorizedException('Invalid credentials');
        }

        return {
            message: 'Login successful',
            success: true
        };
    }


    async findAllUsers() {
        return await this.userRepository.find();
    }





}
