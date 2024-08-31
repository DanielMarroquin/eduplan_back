import { Injectable } from "@nestjs/common";
import { User} from '../common/entities/user.entity'
import { Repository } from "typeorm";
import { InjectRepository } from '@nestjs/typeorm';
import * as bcrypt from 'bcrypt';


@Injectable()
export class AuthService {
    constructor(
        @InjectRepository(User)

        private userRepository: Repository <User>
    ) {
    }

    async validateUser(username: string, pass: string): Promise<any> {
        const user = await this.userRepository.findOne({ where: { username, status: 1 } });

        if (user && await bcrypt.compare(pass, user.password)) {
            const { password, ...result } = user;
            return result;
        }
        return null;
    }





}
